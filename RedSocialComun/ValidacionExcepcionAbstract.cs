using System;
using System.Collections;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Runtime.Serialization;
using System.Security;

namespace RedSocialComun
{
    public abstract class ValidacionExcepcionAbstract : Exception 
    {
        public ValidacionExcepcionAbstract() : base()
        {
        }

        public ValidacionExcepcionAbstract(string message) : base(message)
        {
        }

        [SecuritySafeCritical]
        protected ValidacionExcepcionAbstract(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }

        public ValidacionExcepcionAbstract(string message, Exception innerException) : base(message, innerException)
        {
        }
    }
}
