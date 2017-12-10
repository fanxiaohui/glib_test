/*********************************************
 *
 *
 *
 *
 *
 *
 * ******************************************/
#include <stdio.h>
#include <stdlib.h>
#include <glib.h>
#include <dbus/dbus.h>
#include <dbus/dbus-glib.h>
#include "study_proxy.h"
void plusone_cbk (DBusGProxy *proxy, guint result, GError *error, gpointer userdata);
static void signal_cbk(DBusGProxy *proxy, guint ret, gpointer user_data);
int main(int argc, char **argv)
{
       GMainLoop *mainloop = NULL;
       mainloop = g_main_loop_new(NULL, FALSE);
 DBusGConnection *connection = NULL;
 GError *err = NULL;
 g_type_init();
 if((connection = dbus_g_bus_get(DBUS_BUS_SESSION, &err)) == NULL)
 {
      printf("dbus_g_bus_get--------------failed!\n");
      return 0;
 }
 DBusGProxy *proxy = NULL;
 if((proxy = dbus_g_proxy_new_for_name(connection, "bzd.object", "/bzd/bzd_object", "ddb.study")) == NULL)
 {
      printf("dbus_g_proxy_new_for_name-------------failed!\n");
      return 0;
 }
 dbus_g_proxy_set_default_timeout (proxy, INT_MAX);
 ddb_study_plusone_in_10_min_async_async(proxy, 9, plusone_cbk, NULL);
 guint result = 0;
 ddb_study_plustwo_in_10_min(proxy, 10, &result, &err);
 printf("sync result = %d\n", result);
 dbus_g_proxy_add_signal(proxy, "return_three", G_TYPE_UINT, G_TYPE_INVALID);
 dbus_g_proxy_connect_signal(proxy, "return_three", G_CALLBACK (signal_cbk), NULL, NULL);
 g_main_loop_run(mainloop);
 return 0;
}
static void signal_cbk(DBusGProxy *proxy, guint ret, gpointer user_data)
{
     printf ("receive message from server, value = %d\n", ret);
}
void plusone_cbk(DBusGProxy *proxy, guint result, GError *error, gpointer userdata)
{
     printf("result = %d\n", result);
}
