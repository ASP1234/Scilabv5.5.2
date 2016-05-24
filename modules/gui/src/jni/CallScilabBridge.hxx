/* Generated by GIWS (version 2.0.2) with command:
giws --disable-return-size-array --output-dir src/jni/ --throws-exception-on-error --description-file src/jni/CallScilabBridge.giws.xml
*/
/*

This is generated code.

This software is a computer program whose purpose is to hide the complexity
of accessing Java objects/methods from C++ code.

This software is governed by the CeCILL-B license under French law and
abiding by the rules of distribution of free software.  You can  use,
modify and/ or redistribute the software under the terms of the CeCILL-B
license as circulated by CEA, CNRS and INRIA at the following URL
"http://www.cecill.info".

As a counterpart to the access to the source code and  rights to copy,
modify and redistribute granted by the license, users are provided only
with a limited warranty  and the software's author,  the holder of the
economic rights,  and the successive licensors  have only  limited
liability.

In this respect, the user's attention is drawn to the risks associated
with loading,  using,  modifying and/or developing or reproducing the
software by the user in light of its specific status of free software,
that may mean  that it is complicated to manipulate,  and  that  also
therefore means  that it is reserved for developers  and  experienced
professionals having in-depth computer knowledge. Users are therefore
encouraged to load and test the software's suitability as regards their
requirements in conditions enabling the security of their systems and/or
data to be ensured and,  more generally, to use and operate it in the
same conditions as regards security.

The fact that you are presently reading this means that you have had
knowledge of the CeCILL-B license and that you accept its terms.
*/


#ifndef __ORG_SCILAB_MODULES_GUI_BRIDGE_CALLSCILABBRIDGE__
#define __ORG_SCILAB_MODULES_GUI_BRIDGE_CALLSCILABBRIDGE__
#include <iostream>
#include <string>
#include <string.h>
#include <stdlib.h>
#include <jni.h>

#include "GiwsException.hxx"

        #if defined(_MSC_VER) /* Defined anyway with Visual */
            #include <Windows.h>
        #else
            typedef signed char byte;
        #endif


#ifndef GIWSEXPORT
# if defined(_MSC_VER) || defined(__WIN32__) || defined(__CYGWIN__)
#   if defined(STATIC_LINKED)
#     define GIWSEXPORT
#   else
#     define GIWSEXPORT __declspec(dllexport)
#   endif
# else
#   if __GNUC__ >= 4
#     define GIWSEXPORT __attribute__ ((visibility ("default")))
#   else
#     define GIWSEXPORT
#   endif
# endif
#endif

namespace org_scilab_modules_gui_bridge {
class GIWSEXPORT CallScilabBridge {

private:
JavaVM * jvm;

protected:
jmethodID voidsetMenuEnabledjintintjstringjava_lang_StringjbooleanbooleanID; // cache method id
jmethodID voidsetSubMenuEnabledjintintjstringjava_lang_StringjintintjbooleanbooleanID; // cache method id
jmethodID voidremoveMenujintintjstringjava_lang_StringID; // cache method id
jmethodID jstringdisplayAndWaitContextMenujintintID; // cache method id
jmethodID jintnewMessageBoxID; // cache method id
jmethodID voidsetMessageBoxTitlejintintjstringjava_lang_StringID; // cache method id
jmethodID voidsetMessageBoxMessagejintintjstringjava_lang_StringID; // cache method id
jmethodID voidsetMessageBoxMessagejintintjobjectArray_java_lang_Stringjava_lang_StringID; // cache method id
jclass stringArrayClass;
jmethodID voidmessageBoxDisplayAndWaitjintintID; // cache method id
jmethodID jintgetMessageBoxSelectedButtonjintintID; // cache method id
jmethodID voidsetMessageBoxDefaultSelectedButtonsjintintjintArray_intintID; // cache method id
jmethodID jintArray_getMessageBoxUserSelectedButtonsjintintID; // cache method id
jmethodID voidsetMessageBoxButtonsLabelsjintintjobjectArray_java_lang_Stringjava_lang_StringID; // cache method id
jmethodID voidsetMessageBoxInitialValuejintintjobjectArray_java_lang_Stringjava_lang_StringID; // cache method id
jmethodID jobjectArray_getMessageBoxValuejintintID; // cache method id
jmethodID jintgetMessageBoxValueSizejintintID; // cache method id
jmethodID voidsetMessageBoxListBoxItemsjintintjobjectArray_java_lang_Stringjava_lang_StringID; // cache method id
jmethodID jintgetMessageBoxSelectedItemjintintID; // cache method id
jmethodID voidsetMessageBoxLineLabelsjintintjobjectArray_java_lang_Stringjava_lang_StringID; // cache method id
jmethodID voidsetMessageBoxColumnLabelsjintintjobjectArray_java_lang_Stringjava_lang_StringID; // cache method id
jmethodID voidsetMessageBoxDefaultInputjintintjobjectArray_java_lang_Stringjava_lang_StringID; // cache method id
jmethodID voidsetMessageBoxModaljintintjbooleanbooleanID; // cache method id
jmethodID voidsetMessageBoxIconjintintjstringjava_lang_StringID; // cache method id
jmethodID voidlaunchHelpBrowserjobjectArray_java_lang_Stringjava_lang_Stringjstringjava_lang_StringID; // cache method id
jmethodID voidsearchKeywordjobjectArray_java_lang_Stringjava_lang_Stringjstringjava_lang_Stringjstringjava_lang_StringjbooleanbooleanID; // cache method id
jmethodID jintnewExportFileChooserjintintID; // cache method id
jmethodID jintnewFontChooserID; // cache method id
jmethodID voidfontChooserDisplayAndWaitjintintID; // cache method id
jmethodID voidsetFontChooserFontNamejintintjstringjava_lang_StringID; // cache method id
jmethodID voidsetFontChooserFontSizejintintjintintID; // cache method id
jmethodID voidsetFontChooserBoldjintintjbooleanbooleanID; // cache method id
jmethodID voidsetFontChooserItalicjintintjbooleanbooleanID; // cache method id
jmethodID jstringgetFontChooserFontNamejintintID; // cache method id
jmethodID jintgetFontChooserFontSizejintintID; // cache method id
jmethodID jbooleangetFontChooserBoldjintintID; // cache method id
jmethodID jbooleangetFontChooserItalicjintintID; // cache method id
jmethodID jintnewColorChooserID; // cache method id
jmethodID voidcolorChooserDisplayAndWaitjintintID; // cache method id
jmethodID voidsetColorChooserDefaultColorjintintjintArray_intintID; // cache method id
jmethodID jintArray_getColorChooserSelectedColorjintintID; // cache method id
jmethodID voidsetColorChooserTitlejintintjstringjava_lang_StringID; // cache method id
jmethodID jstringgetClipboardContentsID; // cache method id
jmethodID voidpasteClipboardIntoConsoleID; // cache method id
jmethodID voidcopyConsoleSelectionID; // cache method id
jmethodID voidemptyClipboardID; // cache method id
jmethodID voidsetClipboardContentsjstringjava_lang_StringID; // cache method id
jmethodID voidcopyFigureToClipBoardjintintID; // cache method id
jmethodID jintgetScreenResolutionID; // cache method id
jmethodID jdoublegetScreenWidthID; // cache method id
jmethodID jdoublegetScreenHeightID; // cache method id
jmethodID jintgetScreenDepthID; // cache method id
jmethodID jbooleanprintFigurejintintjbooleanbooleanjbooleanbooleanID; // cache method id
jmethodID jbooleanprintFilejstringjava_lang_StringID; // cache method id
jmethodID jbooleanprintStringjstringjava_lang_Stringjstringjava_lang_StringID; // cache method id
jmethodID jbooleanpageSetupID; // cache method id
jmethodID voidrequestFocusjintintID; // cache method id
jmethodID voidraiseWindowjintintID; // cache method id
jmethodID voiduseCanvasForDisplayjbooleanbooleanID; // cache method id
jmethodID jbooleanuseCanvasForDisplayID; // cache method id
jmethodID voidscilabAboutBoxID; // cache method id
jmethodID voidfireClosingFinishedjintintID; // cache method id



jobject instance;
jclass instanceClass; // cache class

                       
// Caching (if any)


/**
* Get the environment matching to the current thread.
*/
virtual JNIEnv * getCurrentEnv();

public:
// Constructor
/**
* Create a wrapping of the object from a JNIEnv.
* It will call the default constructor
* @param JEnv_ the Java Env
*/
CallScilabBridge(JavaVM * jvm_);

/**
* Create a wrapping of an already existing object from a JNIEnv.
* The object must have already been instantiated
* @param JEnv_ the Java Env
* @param JObj the object
*/
CallScilabBridge(JavaVM * jvm_, jobject JObj);


/** 
* This is a fake constructor to avoid the constructor
* chaining when dealing with extended giws classes 
*/
#ifdef FAKEGIWSDATATYPE
CallScilabBridge(fakeGiwsDataType::fakeGiwsDataType /* unused */) {}
#endif

// Destructor
~CallScilabBridge();

// Generic method
// Synchronization methods
/**
* Enter monitor associated with the object.
* Equivalent of creating a "synchronized(obj)" scope in Java.
*/
void synchronize();

/**
* Exit monitor associated with the object.
* Equivalent of ending a "synchronized(obj)" scope.
*/
void endSynchronize();

// Methods
static void setMenuEnabled(JavaVM * jvm_, int parentUID, char const* menuName, bool status);

static void setSubMenuEnabled(JavaVM * jvm_, int parentUID, char const* menuName, int position, bool status);

static void removeMenu(JavaVM * jvm_, int parentUID, char const* menuName);

static char* displayAndWaitContextMenu(JavaVM * jvm_, int UID);

static int newMessageBox(JavaVM * jvm_);

static void setMessageBoxTitle(JavaVM * jvm_, int id, char const* title);

static void setMessageBoxMessage(JavaVM * jvm_, int id, char const* message);

static void setMessageBoxMessage(JavaVM * jvm_, int id, char const* const* message, int messageSize);

static void messageBoxDisplayAndWait(JavaVM * jvm_, int id);

static int getMessageBoxSelectedButton(JavaVM * jvm_, int id);

static void setMessageBoxDefaultSelectedButtons(JavaVM * jvm_, int id, int const* index, int indexSize);

static int* getMessageBoxUserSelectedButtons(JavaVM * jvm_, int id);

static void setMessageBoxButtonsLabels(JavaVM * jvm_, int id, char const* const* labels, int labelsSize);

static void setMessageBoxInitialValue(JavaVM * jvm_, int id, char const* const* value, int valueSize);

static char** getMessageBoxValue(JavaVM * jvm_, int id);

static int getMessageBoxValueSize(JavaVM * jvm_, int id);

static void setMessageBoxListBoxItems(JavaVM * jvm_, int id, char const* const* items, int itemsSize);

static int getMessageBoxSelectedItem(JavaVM * jvm_, int id);

static void setMessageBoxLineLabels(JavaVM * jvm_, int id, char const* const* labels, int labelsSize);

static void setMessageBoxColumnLabels(JavaVM * jvm_, int id, char const* const* labels, int labelsSize);

static void setMessageBoxDefaultInput(JavaVM * jvm_, int id, char const* const* values, int valuesSize);

static void setMessageBoxModal(JavaVM * jvm_, int id, bool status);

static void setMessageBoxIcon(JavaVM * jvm_, int id, char const* name);

static void launchHelpBrowser(JavaVM * jvm_, char const* const* helps, int helpsSize, char const* language);

static void searchKeyword(JavaVM * jvm_, char const* const* helps, int helpsSize, char const* keyword, char const* language, bool fullText);

static int newExportFileChooser(JavaVM * jvm_, int figureUID);

static int newFontChooser(JavaVM * jvm_);

static void fontChooserDisplayAndWait(JavaVM * jvm_, int objID);

static void setFontChooserFontName(JavaVM * jvm_, int objID, char const* fontName);

static void setFontChooserFontSize(JavaVM * jvm_, int objID, int fontSize);

static void setFontChooserBold(JavaVM * jvm_, int objID, bool bold);

static void setFontChooserItalic(JavaVM * jvm_, int objID, bool italic);

static char* getFontChooserFontName(JavaVM * jvm_, int objID);

static int getFontChooserFontSize(JavaVM * jvm_, int objID);

static bool getFontChooserBold(JavaVM * jvm_, int objID);

static bool getFontChooserItalic(JavaVM * jvm_, int objID);

static int newColorChooser(JavaVM * jvm_);

static void colorChooserDisplayAndWait(JavaVM * jvm_, int objID);

static void setColorChooserDefaultColor(JavaVM * jvm_, int objID, int const* rgb, int rgbSize);

static int* getColorChooserSelectedColor(JavaVM * jvm_, int objID);

static void setColorChooserTitle(JavaVM * jvm_, int objID, char const* title);

static char* getClipboardContents(JavaVM * jvm_);

static void pasteClipboardIntoConsole(JavaVM * jvm_);

static void copyConsoleSelection(JavaVM * jvm_);

static void emptyClipboard(JavaVM * jvm_);

static void setClipboardContents(JavaVM * jvm_, char const* text);

static void copyFigureToClipBoard(JavaVM * jvm_, int figID);

static int getScreenResolution(JavaVM * jvm_);

static double getScreenWidth(JavaVM * jvm_);

static double getScreenHeight(JavaVM * jvm_);

static int getScreenDepth(JavaVM * jvm_);

static bool printFigure(JavaVM * jvm_, int figID, bool postScript, bool displayDialog);

static bool printFile(JavaVM * jvm_, char const* fileName);

static bool printString(JavaVM * jvm_, char const* theString, char const* pageHeader);

static bool pageSetup(JavaVM * jvm_);

static void requestFocus(JavaVM * jvm_, int objUID);

static void raiseWindow(JavaVM * jvm_, int objID);

static void useCanvasForDisplay(JavaVM * jvm_, bool onOrOff);

static bool useCanvasForDisplay(JavaVM * jvm_);

static void scilabAboutBox(JavaVM * jvm_);

static void fireClosingFinished(JavaVM * jvm_, int figUID);


                        /**
                        * Get class name to use for static methods
                        * @return class name to use for static methods
                        */
                        
                static const std::string className()
                {
                return "org/scilab/modules/gui/bridge/CallScilabBridge";
                }
                

                        /**
                        * Get class to use for static methods
                        * @return class to use for static methods
                        */
                        
                static jclass initClass(JNIEnv * curEnv)
                {
                    static jclass cls = 0;

                    if (cls == 0)
                    {
                        jclass _cls = curEnv->FindClass(className().c_str());
                        if (_cls)
                        {
                            cls = static_cast<jclass>(curEnv->NewGlobalRef(_cls));
                        }
                    }

                    return cls;
                 }
                
};


}
#endif
