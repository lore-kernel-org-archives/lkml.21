Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113818;
	b=0OisdQ0y9oNJBcHAlqijCpOWhRdYYQC7H3Zb2SkQwYtEkJXiT3MbbPdAWh+fA+QeRQui
	 KBc2QgMDz4fiHSoBxz16UlhjQX+PrGp/tUe2oydZNLhgOjlEhbw95gkVCTSsKPJUP8DC4
	 gPapogp86ilQ1JVt1WeSw0oyRVUl8UlvFi9oG05wtOALlU64GOsjADE/XIr71wK8Wn4ba
	 TwP82dPrfa12sH21UXqTgSMaouUlGqlOdryMkLt/2aAqlQP3qcLVy/6pTYbkGWQXZ1toF
	 6COkJgJIWZ+0e7U4utje/dvSKp8PbauLSuTf9Dz/GSs2PzH7SyleV8ozP+5g6rxWcGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=tj4ObqBNZzIlr5Ijm5neJ86sZAzelZKa9swIzj0qJkI=;
	b=O2kQWN3X9z7FaKy31yvtCBc7/YAPBgk3j8RfA/y2MfHVI+MuCXFG4gkordUcCs5+0Son
	 rbir+OjCwHsmYLZZNLxqWJyCQ2j9upc1Jx4CxsTl01o+al5U1GjuVMQzw+woZzbHLUd2d
	 dQFME3+7HEmtLl6B8P6udT/FSk32wgFWfNYlO0f+7zFoiNS8XVUQBB127GF6g0eQDNApk
	 JVSyA2O8Gfrhvg4q6H14iA6ex1JdmiTvgLJB0TqSPHI5JI9Jzdubx6bLnKFTIXHSnzHIy
	 XZiLw3c167iMcijzXYDISlxsdGAnqi7XBTmP1tESUbWijdH7/PX/ilEm237ifldr3/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="auS8n9/T";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85753606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85753606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=auS8n9/T
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso43687eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113817; x=1795718617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tj4ObqBNZzIlr5Ijm5neJ86sZAzelZKa9swIzj0qJkI=;
        b=auS8n9/TleYSMYUcxxROJN/R18c4uI6ueii61mq5YX7ONs0UxgW9LdXWYpHqJxg/as
         YixvLBhbbj39ptV/PG4s0DHqBTwwMB1CL3kUOreRizHbMtJ5i0X/9HpOmlxP20cs7fhk
         5X23xPQZQexWwZjeOAcHIaD2OIlU37kSHLlAgiKCtImzub/DeI593GYwGch/UoaotwBA
         kroMXVre05H47VM8PiwUSPhxjtUJPt/JXHQRn8X9TGmMYOHXl4VPc2tuITM6vyWNg+FY
         ZDdqVJc/eyB69yfi6Z/tWPRdLNGhX+jCDk8a7RkPu3+UdXpIX1TTFSBb48l4ByAqEchW
         doug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113817; x=1795718617;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tj4ObqBNZzIlr5Ijm5neJ86sZAzelZKa9swIzj0qJkI=;
        b=URj8lyMDkkZldACVf53d03NgGbzno3lxXYJbgUJaAwhApxaKIuViwVksGN/PCXEe+g
         B5ADSnlRZOehhD1spQ/xUap+YTOT8SUPKjFVbpqitWqKB/KEdwaq67g/Fq+phZq0HXD3
         GKA18ZsI7rzJPH9vmCaiS9K/xC3QfXu1o3KYmuppxqIVEBpsy7khlxM8GhHPgvw5VUa6
         Rft4anrJCRq0lIvaM8myGdeMd5VAabWesJYIRlAbCWInO6ELwwwPvMw2ygN+0Fads9uO
         8PCvMZb9Joyma+A7/FgyEftHnA1OTG6x5az8x41WLSYi3sR6qkHNIKMEODi2HAHVbsQF
         Veew==
X-Forwarded-Encrypted: i=1; AL+hErF84EI4/geMmCm51s/AvdkKZzMuhX1txqZSW4jQ9QJDO6D0DyhfTfHNzaAAc+fjLSM2/PPGT/i9hi+dBK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+83J+vOugqfDOIrEarbZiIDB7VOc0kRC1uQKgCDWuulVsgj7G8
	GQHMA0HUF9N70P10ojNXrF/gMH01oqEAa371jgENuU+odFUQygMxA13S
X-Gm-Gg: AZFdTZe57AD+xHpzOqR2b111rQ8928ggSpe4KlnMKILDihbyT1ebBoLvgBpZO9hy2R+
	9q7FhAEfcWUdn29E8jI8KtvdDsK7QEzsaN4Zbtjb8Zg6N79mUvstY848xkPsykS4nz1aiVALSlD
	omk/hoGwdJ0m6dlPLafXmz1JjMwJTV/Mk6hKiQxtc5GmJjHF2TCOprw8if1Va3RUSYmJnXqoAQq
	AJMplfCdp+x7CC/hEQzw3uZ7HLECtgrnKjnBA+A4st86UueFivRANBB8Kml4mbRzBURgwi8Tzxz
	Lxw9F3HwCFDU83csaONfIMAoiy7TOBOw2yBFm0XMOJIVPNKoKbDvmNQH1GNUg+Hl00uJyIxAI/y
	4Z0eFZBEO0R8FikjqyoFYd7MKsrECdCqxoUhmXt+ZCMc2SZ6eXDGWhG9sZ4ZJa8b5H9WXPQoTLL
	dTiLAILXi//cndWeIZUHKMuHHgmziZbA4afp+CMMLQxVz8POKYNWHknsHOn8oFxig1b965NAs4r
	T5T3SJo/WUyTu3Tt4PQmAVsikLkmGubrtRGZCBLfF+5XEVwhDrcWyja3wiN1HOYYPjUk9j/JSTo
	DqXNDjI/Z9itYh5tIWdSHU7GtFO077efb0FSrJ0mi8ASk1nzyNi40aa0jpR59CuCNN+qq9A1dUf
	NtTSdBF2EtrJzh1Wx9Z8pek8=
X-Received: by 2002:a05:7301:416:b0:356:7ddb:2e54 with SMTP id 5a478bee46e88-38570f27b33mr181716eec.29.1795113816546;
        Thu, 19 Nov 2026 10:43:36 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm1413897eec.3.2026.11.19.10.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 10:43:36 -0800 (PST)
Date: Thu, 19 Nov 2026 10:43:35 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Alok Tiwari <alok.a.tiwari@oracle.com>, Armin Wolf <W_Armin@gmx.de>
CC: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_4/5=5D_platform/x86=3A_lenovo-wmi-ot?=
 =?US-ASCII?Q?her=3A_Properly_implement_no=5Fsingleton_driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <5b82091b356a4134ba59e032bd927049b3a6451a.camel@rong.moe>
References: <20261119-lwmi-no-singleton-v1-0-6b06fcfb5126@rong.moe> <20261119-lwmi-no-singleton-v1-4-6b06fcfb5126@rong.moe> <b5c81884-73b0-4d43-98e5-cd2fedcf583f@app.fastmail.com> <5b82091b356a4134ba59e032bd927049b3a6451a.camel@rong.moe>
Message-ID: <760F863B-4E5C-4100-8D48-BADC3530C65F@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 19, 2026 10:23:18 AM PST, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Mark,
>
>Thanks for reviewing this=2E
>
>On Wed, 2026-11-18 at 17:27 -0500, Mark Pearson wrote:
>>=20
>> On Wed, Nov 18, 2026, at 1:58 PM, Rong Zhang wrote:
>> > The driver declares `=2Eno_singleton =3D true' but stores device-spec=
ific
>> > data to statically allocated tunable_attr_01 variables=2E This makes =
the
>> > driver depend on the frigile fact that no device in wild has more tha=
n
>>=20
>> Minor typo - frigile/fragile
>
>Whoops, I constantly type this word in the wrong way=2E Sigh=2E=2E=2E
>
>>=20
>> > one LENOVO_OTHER_MODE WMI devices=2E
>> >=20
>>=20
>> As an aside - is this really fragile? I mean realistically it's never g=
oing to happen is it?
>
>I wrote the commit message like this because depending on global states
>violates the requirements of a no_singleton driver anyway=2E I will
>rephrase it to make it focus on constifying tunable_attr_01 instead=2E
>
>>=20
>> > Add unique indexes to all statically allocated tunable_attr_01 variab=
les
>> > with some __COUNTER__ tricks, and use them to access lwmi_om_priv's
>> > newly-introduced tunable_attr_01_ctx array=2E In this manner, move al=
l
>> > device-specific data to the tunable_attr_01_ctx array, and constify a=
ll
>> > statically allocated tunable_attr_01 variables to make the driver a
>> > truly no_singleton driver=2E
>
>If the __COUNTER__ tricks are a bit hard for you to keep up with, let me
>explain below:
>
>> >=20
>> > Fixes: 03bb5147da08 ("platform/x86: lenovo-wmi-other: Limit adding=20
>> > attributes to supported devices")
>> > Signed-off-by: Rong Zhang <i@rong=2Emoe>
>> > ---
>> >  drivers/platform/x86/lenovo/wmi-other=2Ec | 54=20
>> > ++++++++++++++++++++++++---------
>> >  1 file changed, 39 insertions(+), 15 deletions(-)
>> >=20
>> > diff --git a/drivers/platform/x86/lenovo/wmi-other=2Ec=20
>> > b/drivers/platform/x86/lenovo/wmi-other=2Ec
>> > index 252ef775f300=2E=2Ef37dca7db034 100644
>> > --- a/drivers/platform/x86/lenovo/wmi-other=2Ec
>> > +++ b/drivers/platform/x86/lenovo/wmi-other=2Ec
>> > @@ -134,15 +134,23 @@ struct tunable_attr_01 {
>> >  	u8 feature_id;
>> >  	u8 device_id;
>> >  	u8 type_id;
>> > +	u8 ctx_id; /* Index to tunable_attr_01_ctx[] */
>> > +};
>> > +
>> > +struct tunable_attr_01_ctx {
>> >  	u8 cd_mode_id; /* mode arg for searching capdata */
>> >  	u8 cv_mode_id; /* mode arg for set/get current_value */
>> >  };
>> >=20
>> > +enum { TUNABLE_ATTR_01_COUNTER_BASE =3D __COUNTER__ + 1 };
>
>__COUNTER__ is like counter++ in C, but for C preprocessor=2E
>
>This uses an enumeration to retrieve its value (say, 403)=2E Once
>retrieved, __COUNTER__ is self-incremented, so the retrieved value plus
>one equals the "current" value=2E
>
>   TUNABLE_ATTR_01_COUNTER_BASE =3D (counter++) + 1 =3D 403 + 1 =3D 404
>
>> > +#define TUNABLE_ATTR_01_COUNTER (__COUNTER__ - TUNABLE_ATTR_01_COUNT=
ER_BASE)
>
>Defining a macro does not consume the __COUNTER__=2E The "current" value
>remains unchanged=2E That's why enumeration is used above and below=2E
>
>> > +
>> >  #define DEFINE_TUNABLE_ATTR_01(_name, _device, _feature, _type)	\
>> > -	static struct tunable_attr_01 _name =3D {			\
>> > +	static const struct tunable_attr_01 _name =3D {		\
>> >  		=2Edevice_id =3D LWMI_DEVICE_ID_##_device,		\
>> >  		=2Efeature_id =3D LWMI_FEATURE_ID_##_feature,	\
>> >  		=2Etype_id =3D LWMI_TYPE_ID_##_type,		\
>> > +		=2Ectx_id =3D TUNABLE_ATTR_01_COUNTER,		\
>
>This does not consume the __COUNTER__, too=2E
>
>> >  	}
>> >=20
>> >  DEFINE_TUNABLE_ATTR_01(ppt_pl1_spl, CPU, CPU_SPL, NONE);
>
>Here it's consumed!
>
>   ppt_pl1_spl=2Ectx_id      =3D (counter++) - 404 =3D 404 - 404 =3D 0
>   ppt_pl1_spl_cl=2Ectx_id   =3D (counter++) - 404 =3D 405 - 404 =3D 1
>
>=2E=2E=2Eand so on=2E
>
>> > @@ -168,6 +176,10 @@ DEFINE_TUNABLE_ATTR_01(dgpu_didvid, GPU,=20
>> > DGPU_DIDVID, NONE);
>> >  DEFINE_TUNABLE_ATTR_01(gpu_nv_bpl, GPU, GPU_NV_BPL, NONE);
>> >  DEFINE_TUNABLE_ATTR_01(gpu_nv_cpu_boost, GPU, GPU_NV_CPU_BOOST, NONE=
);
>
>   gpu_nv_cpu_boost=2Ectx_id =3D (counter++) - 404 =3D 425 - 404 =3D 21
>
>> >=20
>> > +enum { TUNABLE_ATTR_01_NR =3D TUNABLE_ATTR_01_COUNTER };
>
>   TUNABLE_ATTR_01_NR      =3D (counter++) - 404 =3D 426 - 404 =3D 22
>
>That's it! In this manner, the C preprocessor stores self-increment ids
>to all tunable_attr_01 variables, so that the latter can be constified
>during compilation=2E
>
>For your minor note in PATCH 3, I will fix the order when I resubmit the
>series=2E I will wait for Derek's review before the resubmission=2E

Hi Rong,

This largely looks like what we discussed a few months prior so I'm okay w=
ith the direction this is taking=2E I've looked at everything but need to d=
o some fine combing and testing=2E I'm not sure when I'll get to that with =
my current backlog, so don't wait on me to iterate=2E

Cheers,
Derek

>Thanks,
>Rong
>
>> > +
>> > +static_assert(TUNABLE_ATTR_01_NR > 0 && TUNABLE_ATTR_01_NR < U8_MAX)=
;
>> > +
>> >  struct lwmi_om_priv {
>> >  	struct component_master_ops *ops;
>> >=20
>> > @@ -183,6 +195,8 @@ struct lwmi_om_priv {
>> >=20
>> >  	struct lwmi_fan_info fan_info[LWMI_FAN_NR];
>> >=20
>> > +	struct tunable_attr_01_ctx tunable_attr_ctx[TUNABLE_ATTR_01_NR];
>> > +
>> >  	struct {
>> >  		bool capdata00_collected : 1;
>> >  		bool capdata_fan_collected : 1;
>> > @@ -1018,7 +1032,7 @@ static u32 tunable_attr_01_id(const struct=20
>> > tunable_attr_01 *attr, u8 mode)
>> >=20
>> >  struct capdata01_attr {
>> >  	struct kobj_attribute kobj_attr;
>> > -	struct tunable_attr_01 *tunable_attr;
>> > +	const struct tunable_attr_01 *tunable_attr;
>> >  	union {
>> >  		enum attribute_property prop;
>> >  		const char *display_name;
>> > @@ -1027,7 +1041,7 @@ struct capdata01_attr {
>> >=20
>> >  struct capdata01_attr_group {
>> >  	const struct attribute_group *attr_group;
>> > -	struct tunable_attr_01 *tunable_attr;
>> > +	const struct tunable_attr_01 *tunable_attr;
>> >  };
>> >=20
>> >  static inline struct lwmi_om_priv *kobj_to_om_priv(const struct=20
>> > kobject *kobj)
>> > @@ -1041,6 +1055,12 @@ kobj_attr_to_cd01_attr(const struct=20
>> > kobj_attribute *kattr)
>> >  	return container_of_const(kattr, struct capdata01_attr, kobj_attr);
>> >  }
>> >=20
>> > +static inline struct tunable_attr_01_ctx *tunable_to_ctx(struct=20
>> > lwmi_om_priv *priv,
>> > +							 const struct tunable_attr_01 *tunable_attr)
>> > +{
>> > +	return &priv->tunable_attr_ctx[tunable_attr->ctx_id];
>> > +}
>> > +
>> >  /* Attribute Methods */
>> >=20
>> >  /**
>> > @@ -1098,12 +1118,13 @@ static ssize_t attr_capdata01_show(struct kob=
ject *kobj,
>> >  	struct lwmi_om_priv *priv =3D kobj_to_om_priv(kobj);
>> >  	const struct capdata01_attr *cd01_attr =3D kobj_attr_to_cd01_attr(k=
attr);
>> >  	const struct tunable_attr_01 *tunable_attr =3D cd01_attr->tunable_a=
ttr;
>> > +	struct tunable_attr_01_ctx *ctx =3D tunable_to_ctx(priv, tunable_at=
tr);
>> >  	enum attribute_property prop =3D cd01_attr->prop;
>> >  	struct capdata01 capdata;
>> >  	u32 attribute_id;
>> >  	int value, ret;
>> >=20
>> > -	attribute_id =3D tunable_attr_01_id(tunable_attr, tunable_attr->cd_=
mode_id);
>> > +	attribute_id =3D tunable_attr_01_id(tunable_attr, ctx->cd_mode_id);
>> >=20
>> >  	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata)=
;
>> >  	if (ret)
>> > @@ -1152,6 +1173,7 @@ static ssize_t attr_current_value_store(struct=
=20
>> > kobject *kobj,
>> >  	struct lwmi_om_priv *priv =3D kobj_to_om_priv(kobj);
>> >  	const struct capdata01_attr *cd01_attr =3D=20
>> > kobj_attr_to_cd01_attr(kattr);
>> >  	const struct tunable_attr_01 *tunable_attr =3D cd01_attr->tunable_a=
ttr;
>> > +	struct tunable_attr_01_ctx *ctx =3D tunable_to_ctx(priv, tunable_at=
tr);
>> >  	struct wmi_method_args_32 args =3D {};
>> >  	struct capdata01 capdata;
>> >  	enum thermal_mode mode;
>> > @@ -1165,7 +1187,7 @@ static ssize_t attr_current_value_store(struct=
=20
>> > kobject *kobj,
>> >  	if (mode !=3D LWMI_GZ_THERMAL_MODE_CUSTOM)
>> >  		return -EBUSY;
>> >=20
>> > -	args=2Earg0 =3D tunable_attr_01_id(tunable_attr, tunable_attr->cd_m=
ode_id);
>> > +	args=2Earg0 =3D tunable_attr_01_id(tunable_attr, ctx->cd_mode_id);
>> >=20
>> >  	ret =3D lwmi_cd01_get_data(priv->cd01_list, args=2Earg0, &capdata);
>> >  	if (ret)
>> > @@ -1178,7 +1200,7 @@ static ssize_t attr_current_value_store(struct=
=20
>> > kobject *kobj,
>> >  	if (value < capdata=2Emin_value || value > capdata=2Emax_value)
>> >  		return -EINVAL;
>> >=20
>> > -	args=2Earg0 =3D tunable_attr_01_id(tunable_attr, tunable_attr->cv_m=
ode_id);
>> > +	args=2Earg0 =3D tunable_attr_01_id(tunable_attr, ctx->cv_mode_id);
>> >  	args=2Earg1 =3D value;
>> >=20
>> >  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_S=
ET,
>> > @@ -1208,6 +1230,7 @@ static ssize_t attr_current_value_show(struct=
=20
>> > kobject *kobj,
>> >  	struct lwmi_om_priv *priv =3D kobj_to_om_priv(kobj);
>> >  	const struct capdata01_attr *cd01_attr =3D=20
>> > kobj_attr_to_cd01_attr(kattr);
>> >  	const struct tunable_attr_01 *tunable_attr =3D cd01_attr->tunable_a=
ttr;
>> > +	struct tunable_attr_01_ctx *ctx =3D tunable_to_ctx(priv, tunable_at=
tr);
>> >  	struct wmi_method_args_32 args =3D {};
>> >  	enum thermal_mode mode;
>> >  	int retval;
>> > @@ -1218,8 +1241,8 @@ static ssize_t attr_current_value_show(struct=
=20
>> > kobject *kobj,
>> >  		return ret;
>> >=20
>> >  	/* If "no-mode" is the supported mode, ensure we never send current=
 mode */
>> > -	if (tunable_attr->cv_mode_id =3D=3D LWMI_GZ_THERMAL_MODE_NONE)
>> > -		mode =3D tunable_attr->cv_mode_id;
>> > +	if (ctx->cv_mode_id =3D=3D LWMI_GZ_THERMAL_MODE_NONE)
>> > +		mode =3D ctx->cv_mode_id;
>> >=20
>> >  	args=2Earg0 =3D tunable_attr_01_id(tunable_attr, mode);
>> >=20
>> > @@ -1243,21 +1266,22 @@ static ssize_t attr_current_value_show(struct=
=20
>> > kobject *kobj,
>> >   * First check if the attribute has a corresponding data table under=
=20
>> > custom mode
>> >   * (0xff), then under no mode (0x00)=2E If either of those passes, c=
heck=20
>> > if the
>> >   * supported field of the capdata struct is > 0=2E If it is supporte=
d,=20
>> > store the
>> > - * successful mode in the cd_mode_id field of tunable_attr=2E
>> > + * successful mode in the cd_mode_id field of tunable_attr_01_ctx=2E
>> >   *
>> >   * If the attribute capdata shows it is supported, attempt to=20
>> > determine the mode
>> >   * for the current value property get/set methods using a similar=20
>> > pattern to the
>> >   * capdata table check=2E If the value returned by either mode is 0 =
or=20
>> > an error,
>> >   * assume that mode is not supported=2E Otherwise, store the success=
ful=20
>> > mode in the
>> > - * cv_mode_id field of tunable_attr=2E
>> > + * cv_mode_id field of tunable_attr_01_ctx=2E
>> >   *
>> >   * If any of the above checks fail then the attribute is not fully=
=20
>> > supported=2E
>> >   *
>> >   * Return: true if capdata and set/get modes are found, otherwise=20
>> > false=2E
>> >   */
>> >  static bool lwmi_attr_01_is_supported(struct lwmi_om_priv *priv,
>> > -				      struct tunable_attr_01 *tunable_attr)
>> > +				      const struct tunable_attr_01 *tunable_attr)
>> >  {
>> > +	struct tunable_attr_01_ctx *ctx =3D tunable_to_ctx(priv, tunable_at=
tr);
>> >  	u8 modes[2] =3D { LWMI_GZ_THERMAL_MODE_CUSTOM,=20
>> > LWMI_GZ_THERMAL_MODE_NONE };
>> >  	struct wmi_method_args_32 args =3D {};
>> >  	bool cd_mode_found =3D false;
>> > @@ -1265,7 +1289,7 @@ static bool lwmi_attr_01_is_supported(struct=20
>> > lwmi_om_priv *priv,
>> >  	struct capdata01 capdata;
>> >  	int retval, ret, i;
>> >=20
>> > -	/* Determine tunable_attr->cd_mode_id */
>> > +	/* Determine cd_mode_id  */
>> >  	for (i =3D 0; i < ARRAY_SIZE(modes); i++) {
>> >  		args=2Earg0 =3D tunable_attr_01_id(tunable_attr, modes[i]);
>> >=20
>> > @@ -1273,7 +1297,7 @@ static bool lwmi_attr_01_is_supported(struct=20
>> > lwmi_om_priv *priv,
>> >  		if (ret || !capdata=2Esupported)
>> >  			continue;
>> >=20
>> > -		tunable_attr->cd_mode_id =3D modes[i];
>> > +		ctx->cd_mode_id =3D modes[i];
>> >  		cd_mode_found =3D true;
>> >  		break;
>> >  	}
>> > @@ -1283,7 +1307,7 @@ static bool lwmi_attr_01_is_supported(struct=20
>> > lwmi_om_priv *priv,
>> >=20
>> >  	dev_dbg(&priv->wdev->dev, "cd_mode_id: %#010x\n", args=2Earg0);
>> >=20
>> > -	/* Determine tunable_attr->cv_mode_id, returns 1 if supported */
>> > +	/* Determine cv_mode_id, returns 1 if supported  */
>> >  	for (i =3D 0; i < ARRAY_SIZE(modes); i++) {
>> >  		args=2Earg0 =3D tunable_attr_01_id(tunable_attr, modes[i]);
>> >=20
>> > @@ -1293,7 +1317,7 @@ static bool lwmi_attr_01_is_supported(struct=20
>> > lwmi_om_priv *priv,
>> >  		if (ret || !retval)
>> >  			continue;
>> >=20
>> > -		tunable_attr->cv_mode_id =3D modes[i];
>> > +		ctx->cv_mode_id =3D modes[i];
>> >  		cv_mode_found =3D true;
>> >  		break;
>> >  	}
>> >=20
>> > --=20
>> > 2=2E55=2E0
>>=20
>> This one defeated me I'm afraid (the counter bits in particular) - I ne=
ed to look at it with fresh eyes as my brain has packed up for the day=2E
>>=20
>> Mark

