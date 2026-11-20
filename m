Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182301;
	b=oBS6v01LxOHTX6FvPAm5nsRwqT8XzhRZLG4NoRlK1Yb6uhEIuVGNUTUCeLjUX6qyHJa7
	 +tmIgfjg1p+LUtjGvxmTn6+AsN7YbuPGfU07R8f4jC8RaEdgv8E7A/Q8tseLTkj8xhyHp
	 C+3CgPZCUWRIlUw1ZRS0USqq+ay/QkIZ227SQDFL/9pKqgh/d4KktqCZbmbmZLXnt8RL+
	 6NRzo3O7n2xElVIv3UEv4meyIIdPR1+kdAZz240X1VPU2R2kStRu3ZybUsw2aq/DWFpO+
	 rK0/Kt+RSTxYPg6Pe6StaqROk3mso+zTRSTPJUBKu7ZUX3dCQT2rOiKjl1OqGcO+P5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=lLv8k8lrm+YaEOIWRLJsJHy/ct/axSyoAyIjwlu8Pmg=;
	b=b76GgWc3/CusvajIBtVJ57UXFhJVNbxhiErSIWO+UNh9G128VkyGpTPL6tu6LPKJioS6
	 m6/RJWjFSXW1RSGNY43zK3U45UQ4w68HCpZojDs326KzM6uOL4bEfO7d2FjRj800k+QuA
	 OTgbcOmaS1VJ0ArTqaliZ0G9SmERyH3Yq8E148IQcvuw/XBWWmRomKSh1+juznF52mIOq
	 Rvod69+G8+iP4VkcJALSP6DltRpk6dJS13Z6z0ro5XZakEsyq0Ia6ENFLGM54LU8E2wmA
	 EoO+G4/htxii4EQBgIDWvesqjy5oMnzuSuY0cspLgRp55mH06fofR0BsFSh8prEjF1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="D6L+OL//";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A858D606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A858D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D6L+OL//
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so6829345e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182299; x=1795787099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lLv8k8lrm+YaEOIWRLJsJHy/ct/axSyoAyIjwlu8Pmg=;
        b=D6L+OL//esz9ADmr+k5uDLbPEXaBVNenZxs4ZYUZrOGb+TLjunAew1zBpaURdvDZJ5
         ciaX24R13FLDpimb1IBzZWH+uX1UjPHQ5DStoN33jMBJTVsL8JfKVMTNnArLy+d/GtJu
         HzdTNPIXbiMQCXWMofox9ZNfv51ZMZJBsl5UXhs1KBSijsvUs36dyaJyFDr/KGqgEKOj
         hpsZgcyoTLh3TY1Z/r/TW1/wBlm/KQBWm2YdiNUpZBvDcRfDY59YWL14ZVAzlz0Wj8AX
         yxgYWUmFoyyAMh2vhHt7bORyvbRxoPfA7qwTYl2xxA7NUBPXyvwt1t5Xsn+NyIqlWp22
         N89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182299; x=1795787099;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lLv8k8lrm+YaEOIWRLJsJHy/ct/axSyoAyIjwlu8Pmg=;
        b=0ZpaDI/RY7LttAa+enYWv9JbMYwmWrkhYSNVU1aW8Ef4e80doW2P7O4OkAsOerFadb
         YZtMpEFPDChsz7qfHQ1+K4BfNnlyDO7E04EyPj2wbc1xgdK5i4dvacJOabzezH0ZB3xg
         LXOly51JeTY00lFYcE6aS5Jv0Zf+etJWt7sMxgzCwvuc+5aIw4NxKsynOg4ir8KRq53o
         aJBq5MgjoUZoOhpQ3BSHzpNgH4WiiRsaTz+j7iqJEBlVPo4PC/lKQs5A1/Lm0ib2bmRu
         mGk2eUwOKSfld9dcCpv0E5B0ZyjqODlcrXF1LXL72zrhdGbfnxSoGYZ+Sb+Lqs1LGWzP
         V0qw==
X-Forwarded-Encrypted: i=1; AL+hErEh+u8bzEhMlcDcEYawv96UoCiCMROBKr/rMLoEBS1DW0rI/yG9hg3XCneLi1eNPNQ1W5sTvLmFiDT9DFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TTiNWQiF3ywgEHP6wI8WZZvdv4Pz2tz7xVLJQyQYWTPdP73rb
	COcCIDObgpQtAi8I3iPfEqcUoxr8bmJ7r1PaF+Ue+4UBd3JTXIaJgnBy
X-Gm-Gg: AYBFou0vfcW8Fyfgn+NxLcu4h39267B20gnofQ5H2e8olhHV3ZByF5DVrMLk903yRm1
	P7XUh9OdCWN/IqmeqDlWpKsIJQCgc9NPASngVvL1hxHIxUqwBshaoexSOB1tzbnKPY8nGJwGP9O
	Tv6CzcV9bO2GuUoJhFt4hheMpidxuJVdEd35CYOui+d4ZhQ9Ru5O9bSneFCjJ2RKapHpU7NT6P4
	7PKykV6ZKfvEgErUQ3JbGWNKERQ5aynIZvuXxGhj+8csYwb8jKLn6m2MEt665q5IipyfLLx642Q
	vvSP1SYhvivSB4C9hc5x+cR3Se9T7C6IkVsg7WF+xPCw/VRFpo89HtKGTmiJBIZzo6OnEFDxzQF
	WBYAngnJiaySE+QvkhuA6EUnuwwuAKxb+kUp4IT0t+QqpzDHowhvhv2r0KCrtMhpfUh2GJpi+rw
	ub6VgDGaqfdfjl1Ka0wcM9h6KbCaHbLzWiN3uMHU1WKu+S+SFDGiA2VaeXu4vhTHhGptF0eh7pn
	GHo4uYnEK5WVUexSj2+jdW598t4LQ/iNlz7xN6yJ3SjIDoAOVdj7jISKSvJgEpvWZ1RR/MEua78
	IYdkYl06riK/KvdZiENOkJP1IzUiCTy0aRFEjcAonL+mZ/1NxC3uuqaXCkUAQPZSMQ==
X-Received: by 2002:a05:600c:a08b:b0:4bb:6651:9eda with SMTP id 5b1f17b1804b1-4bb88922ca4mr64148625e9.14.1795182298763;
        Fri, 20 Nov 2026 05:44:58 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm25958065e9.4.2026.11.20.05.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:44:58 -0800 (PST)
Date: Fri, 20 Nov 2026 13:44:57 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Mario Limonciello <superm1@kernel.org>, Mario Limonciello
 <mario.limonciello@amd.com>, Hans de Goede <hansg@kernel.org>, Ma Jun
 <Jun.Ma2@amd.com>, Evan Quan <quanliangl@hotmail.com>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86/amd: send WBRF DSM payload as buffer
Message-ID: <20261120134457.19baa19c@pumpkin>
In-Reply-To: <65fb4293-0c29-266b-28bb-7f7540735a70@linux.intel.com>
References: <20261102-superm1-wbrf-v2-1-28b02bb4ce61@kernel.org>
	<65fb4293-0c29-266b-28bb-7f7540735a70@linux.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Nov 2026 12:12:03 +0200 (EET)
Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> wrote:

> On Mon, 2 Nov 2026, Mario Limonciello wrote:
>=20
> > Spec defines the WBRF record _DSM argument as a single buffer that packs
> > the header and frequency ranges. The driver instead built a package of
> > integers, so firmware on some systems abort \WBRF with AE_AML_OPERAND_T=
YPE
> > when dereferencing Arg2[0].
> >=20
> > Encode the payload into a little-endian buffer and hand it as the lone
> > package element.
> >=20
> > Fixes: 58e82a62669d ("platform/x86/amd: Add support for AMD ACPI based =
Wifi band RFI mitigation feature")
> > Signed-off-by: Mario Limonciello <superm1@kernel.org>
> > ---
> > Changes in v2:
> > - Declare payload with __free(kfree) at the kzalloc() site, after input
> >   validation, instead of initializing it to NULL at the top of
> >   wbrf_record() (Sashiko)
> > - Compute payload length with struct_size_t() so it no longer depends on
> >   payload being declared earlier (Sashiko)
> > - Link to v1: https://patch.msgid.link/20261102-superm1-wbrf-v1-1-b58d8=
d85277c@kernel.org
> > ---
> >  drivers/platform/x86/amd/wbrf.c | 75 +++++++++++++++++++++++----------=
--------
> >  1 file changed, 43 insertions(+), 32 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/amd/wbrf.c b/drivers/platform/x86/amd=
/wbrf.c
> > index 3281357185d1f..2afb574e4327d 100644
> > --- a/drivers/platform/x86/amd/wbrf.c
> > +++ b/drivers/platform/x86/amd/wbrf.c
> > @@ -6,6 +6,8 @@
> > =20
> >  #include <linux/acpi.h>
> >  #include <linux/acpi_amd_wbrf.h>
> > +#include <asm/byteorder.h>
> > +#include <linux/slab.h> =20
>=20
> Please put asm one into own group.
>=20
> > =20
> >  /*
> >   * Functions bit vector for WBRF method
> > @@ -29,6 +31,17 @@ struct amd_wbrf_ranges_out {
> >  	struct freq_band_range	band_list[MAX_NUM_OF_WBRF_RANGES];
> >  } __packed;
> > =20
> > +struct wbrf_record_entry {
> > +	__le64		start;
> > +	__le64		end; =20
>=20
> Include
>=20
> > +} __packed; =20

Even, why __packed (for both).

>=20
> Include
>=20
> > +
> > +struct wbrf_record_payload {
> > +	__le32			num_of_ranges;
> > +	__le32			action;
> > +	struct wbrf_record_entry	ranges[];
> > +} __packed;
> > +
> >  static const guid_t wifi_acpi_dsm_guid =3D
> >  	GUID_INIT(0x7b7656cf, 0xdc3d, 0x4c1c,
> >  		  0x83, 0xe9, 0x66, 0xe7, 0x21, 0xde, 0x30, 0x70);
> > @@ -42,8 +55,9 @@ static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);
> >  static int wbrf_record(struct acpi_device *adev, uint8_t action, struc=
t wbrf_ranges_in_out *in)
> >  {
> >  	union acpi_object argv4;
> > +	union acpi_object args[1];
> >  	u32 num_of_ranges =3D 0;
> > -	u32 num_of_elements;
> > +	size_t payload_len;
> >  	u32 arg_idx =3D 0;
> >  	int ret;
> >  	u32 i;
> > @@ -64,45 +78,39 @@ static int wbrf_record(struct acpi_device *adev, ui=
nt8_t action, struct wbrf_ran
> >  	if (num_of_ranges !=3D in->num_of_ranges)
> >  		return -EINVAL;
> > =20
> > -	/*
> > -	 * Every input frequency band comes with two end points(start/end)
> > -	 * and each is accounted as an element. Meanwhile the range count
> > -	 * and action type are accounted as an element each.
> > -	 * So, the total element count =3D 2 * num_of_ranges + 1 + 1.
> > -	 */
> > -	num_of_elements =3D 2 * num_of_ranges + 2;
> > -
> > -	union acpi_object *tmp __free(kfree) =3D kzalloc_objs(*tmp,
> > -							    num_of_elements);
> > -	if (!tmp)
> > +	payload_len =3D struct_size_t(struct wbrf_record_payload, ranges, num=
_of_ranges); =20
>=20
> Include.
>=20
> > +	struct wbrf_record_payload *payload __free(kfree) =3D =20
>=20
> Include for __free()
>=20
> > +		kzalloc(payload_len, GFP_KERNEL);
> > +	if (!payload)
> >  		return -ENOMEM;
> > =20
> > -	argv4.package.type =3D ACPI_TYPE_PACKAGE;
> > -	argv4.package.count =3D num_of_elements;
> > -	argv4.package.elements =3D tmp;
> > -
> > -	/* save the number of ranges*/
> > -	tmp[0].integer.type =3D ACPI_TYPE_INTEGER;
> > -	tmp[0].integer.value =3D num_of_ranges;
> > -
> > -	/* save the action(WBRF_RECORD_ADD/REMOVE/RETRIEVE) */
> > -	tmp[1].integer.type =3D ACPI_TYPE_INTEGER;
> > -	tmp[1].integer.value =3D action;
> > +	payload->num_of_ranges =3D cpu_to_le32(num_of_ranges);
> > +	payload->action =3D cpu_to_le32(action); =20
>=20
> Include
>=20
> > -	arg_idx =3D 2;
> > +	arg_idx =3D 0;
> >  	for (i =3D 0; i < ARRAY_SIZE(in->band_list); i++) {
> >  		if (!in->band_list[i].start || !in->band_list[i].end)
> >  			continue;
> > =20
> > -		tmp[arg_idx].integer.type =3D ACPI_TYPE_INTEGER;
> > -		tmp[arg_idx++].integer.value =3D in->band_list[i].start;
> > -		tmp[arg_idx].integer.type =3D ACPI_TYPE_INTEGER;
> > -		tmp[arg_idx++].integer.value =3D in->band_list[i].end;
> > +		payload->ranges[arg_idx].start =3D cpu_to_le64(in->band_list[i].star=
t);
> > +		payload->ranges[arg_idx].end =3D cpu_to_le64(in->band_list[i].end);
> > +		arg_idx++;
> >  	}
> > =20
> > +	argv4.package.type =3D ACPI_TYPE_PACKAGE;
> > +	argv4.package.count =3D ARRAY_SIZE(args); =20
>=20
> Include.
>=20
> You're missing lots of headers, admittedly, many are pre-existing=20
> problems.
>=20
> > +	argv4.package.elements =3D args;
> > +
> > +	args[0].type =3D ACPI_TYPE_BUFFER;
> > +	args[0].buffer.length =3D payload_len;
> > +	args[0].buffer.pointer =3D (u8 *)payload;
> > + =20
>=20
>=20
>=20
> >  	union acpi_object *obj __free(kfree) =3D
> > -		acpi_evaluate_dsm(adev->handle, &wifi_acpi_dsm_guid,
> > -				  WBRF_REVISION, WBRF_RECORD, &argv4);
> > +		acpi_evaluate_dsm(adev->handle,
> > +				  &wifi_acpi_dsm_guid,
> > +				  WBRF_REVISION,
> > +				  WBRF_RECORD,
> > +				  &argv4);
> > =20
> >  	if (!obj)
> >  		return -EINVAL;
> > @@ -236,8 +244,11 @@ int amd_wbrf_retrieve_freq_band(struct device *dev=
, struct wbrf_ranges_in_out *o
> >  	param.string.length =3D 0;
> >  	param.string.pointer =3D NULL;
> > =20
> > -	obj =3D acpi_evaluate_dsm(adev->handle, &wifi_acpi_dsm_guid,
> > -							WBRF_REVISION, WBRF_RETRIEVE, &param);
> > +	obj =3D acpi_evaluate_dsm(adev->handle,
> > +				&wifi_acpi_dsm_guid,
> > +				WBRF_REVISION,
> > +				WBRF_RETRIEVE,
> > +				&param);
> >  	if (!obj)
> >  		return -EINVAL; =20
>=20
> Two unrelated space only changes.
>=20
> I don't think the n line version is even an improvement in the former=20
> case.

Or either case. One parameter per line isn't a sane style.

David

>=20

