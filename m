Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795023602;
	b=OL5cUmXim5amhOGVTjXGNiweHRhPYpoOmF+2X4t4x7E6D3wAkLrpinyZTGwDoX+szqnL
	 4Bmuyz+2ToxnsgEMG4HdeDXDSKKn5Jokhsa0Lz6dB13PrMEluqE1aSEbhk3En/9k2UKRa
	 /+55UFHEH9almHY6GwnyiJDoo/ErawYwNjMWZNK0QvdtXCnb1Z93JJodpn791tET4nnCB
	 xvuITHGKZb6RHlPGfFctSNOELva77k+uuyipesz+wc3dlzLQzAY0RkG9El2WX6PnNTovL
	 rWDkbEJjGv5lnuoxmE8XZ3A54hEi5BB2FXaToSB3AsrskGP9WSaq/YUk4sBXSNMhsCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=B+XUPKMI1yUUNSlRJbGmbg4ef/Yy+CIXY00tImGIAcM=;
	b=1QxmXrKyiS9TzqZjhYIn9p6EarZUARuk+2CPCTlB6VktDxtWXsZEQGKu7GI6zYRgnu4g
	 OyPsTQLzy9A777oxAz7ikLGbqQOfOu2tvdQ2Ac1qltf9Eh6+rmBEndd5oEp6iJFTBTDKO
	 Am4zJQHd9Wehk+NfPcw/z098E2UBymys0XQTqBPHrTyemM3Ox9v0fmEhTL7KvJNy4LR4l
	 kGl5MtJWSorAlfPtq7fymdQgsY5Gay6aT04AOV6ZZYjTW01mIZDvP1HRHryspPiVvrQw0
	 jqxIHmLBaFR5WttVZd3vRmuT2RI8Auklm2Q7h5mGCWscjetqzNGOtEhUSyu0eixU+wA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pi0.com;
	spf=pass smtp.mailfrom=domojo.com;
	dkim=pass header.d=pi0.com header.i=@pi0.com header.a=rsa-sha256 header.s=google header.b=OhdqPndI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6782606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6782606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pi0.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=domojo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pi0.com header.i=@pi0.com header.a=rsa-sha256 header.s=google header.b=OhdqPndI
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so12581365e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:40:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795023600; cv=none;
        d=google.com; s=arc-20260327;
        b=jD5nVaoybnUI5VIxcF3hfEYGH6WyTYJ2H20U0dUJ1K67lTpEezSla/PeyUgjwlVBDq
         F27LyKbeKK3p83ivVlBo/Bzvqxl/5PX31DF00EDqA9+a/99qdI/VArhqQcj5SDYDZ6+g
         jj69wWK92KnOzW6rYna0y3uAXVxw+hkvpwerobighU40NNDFFwC39CaO18BICq4MWgLW
         dQoj/pKNAlS0tt9sX7qLmlO8vhPA4fAApk2OamJXQoDQ3i6fBwzuW5VEfH2mrM6hlBQ/
         v/6bj5GoykwODoGb0a1CD36k2rJ4R7sJsWEmshuyxY9mkZY296BU00hndeknm55EqHfI
         zVyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B+XUPKMI1yUUNSlRJbGmbg4ef/Yy+CIXY00tImGIAcM=;
        fh=5WNiWTml0NjUJ3JO+2+I1DoPAbgvRO9xuszCJDJqCyU=;
        b=GqR1HUmB1fnaRGjO8h04tlZEKRGKlSToI6/NTNZ8d9zvhjSX/2kZTTYP5GMtJdVD+p
         601rtBCf8loSL7FC4bmP0h0DkOKMTDsZZWvFSm2XalbMXEaGlq2KncPlFYTXipVZWaS/
         IiRHkAYRqnrssaU1sf0KczTrwUjCLgU5LrSznsMiHuIhXToMgn0mZPGP3U75PxeApkBp
         RpGpiprxlxfv4s64QiOp5NB/oRMLvvu7Q4dDAw2hkdhlVaQlJrR4gwcvbMdZbIVcxRGd
         7rEqsyU0P8cuvFBlmoz8s6log8NpqWafDWPohg96pCcndTy8Uzm2b9Bb+uQe2auszvzy
         VrCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pi0.com; s=google; t=1795023600; x=1795628400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B+XUPKMI1yUUNSlRJbGmbg4ef/Yy+CIXY00tImGIAcM=;
        b=OhdqPndIk+TD84m+YE4+0Pzk7ej7LLwS52ppUAMWrHpPsp0AfZwG+NVVWENuXGQXlD
         0UCxZRH894dlb0wV+sTMIB91QVUNhoujRpDW4fj7+XMo9fs1Vtora72J/ibxmKMsS0lR
         Yz3/6WL4dDQK9CylDbmbEH7/yb5NRldvcFfNmCsH19NQToPdSsKZJdE1SS0GhNwbB8e9
         A8AJol/4hnJiinBmpkaMY85tFPzIzEVsJCMEvZUJo0BYxT85J1acfmMgJkhrK31fy0uP
         1kYcJYbHbHBhH7sLjO2C78BGCewRRrq25k3d8arfIBDJYoAKH+jL4dQqeD1PPjQNM1PA
         0yDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023600; x=1795628400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+XUPKMI1yUUNSlRJbGmbg4ef/Yy+CIXY00tImGIAcM=;
        b=W9XcF7Jf8gpfvyBd30rv0bp8mY1RglaViLpc0tEO7XnVQXSpJqFWmGE8p/GEX4l6k1
         0hw2xjlloL7soDt8/5pIiyx6nJ3BmczDF8yyUC8OjXWCmttPCpJhILv5bzJ222yBKC1D
         Wig/OZDVQLfROIPwtO+sijz367Y9jBsUbScNWPI/b52DKsQIw9/e93yRmiOSn0zoqvgB
         GE4UVKwuOZs6AZDgq0WTOAPaiBH8bl2Q7kjJoy3VNiAA4qJ5pzMy5un52B4dNEkuAaDh
         3Mj0fMBfgClOLEaYsS7Eg2KZKdiJERuA8QE+BghAUx2Vp6j6XDbVqSE41yYrGHLRZhRo
         XDRQ==
X-Forwarded-Encrypted: i=1; AL+hErGTpkH/As7MhLiV5R7IRVPof5ECr3PyVjYgo2qFdmUOPQQ5+CmhAxTzMRDWycMLr2a/e9R8+lDjBfgxMdU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/77nvJFrMCY3JDB9bLwW3uQCdrNeieCYiyU+EYnh5+NUh6QMPh
	ztF/NJ6bEGlt9epUSC51br/3pOVHqgI9Uu0yVt/AXIMD+djAf5tpfAzlowopCUn4r1kX3WIxZDk
	QS1JwhclcCaJHVJsixiplPOvy5b9/lVZQjFppioFlxw==
X-Gm-Gg: AYBFou0UK6maRvH3Pk0zU5SqjE5RxVKRwYGSINkv4MqSN3mX9p+T2Oy6vvyk/w5EOHW
	NKFSC60nufg3ag0tygPZO4lKDIpGuCgGv2nL0SgmUQqnW49lJ09n0/OA6yizhN6wZn0kfh4BxqG
	aRbLQIMRJ8rbcuUXVsHE7hfZHQh8moCjqCJ5lBgnGIrIqZ1CcQC02UPRY76NLWsGgfOW185pDcK
	fgySDE67F/ATPlD+4dlTyDpet3njT2mblX3H16Ng0va2T8R0rhM2HD00KOXRAHMcDvLLFv5plGA
	jfPMrzEelg3Wo3kl3bqQbL7YzVOhsw+BzJEEOfnMJvAm5eTzUtNwUHlK7/GAeH14T3prH3XGguf
	TL8ERPwXWEVhzEDZj91gPSX0Q4deyUBIl9O7OBiQF2fmxfCqGL3iqEziBlgPxIGURT1BOGnbi6r
	jTQMkCgQ9/gGvnU4WQTgtqabKVuTI0sXXvTFnTKWrXpilpF+ZIww==
X-Received: by 2002:a05:600c:4504:b0:4ba:7e6:53d6 with SMTP id
 5b1f17b1804b1-4bb7da52ad6mr61041225e9.33.1795023599827; Wed, 18 Nov 2026
 09:39:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118012321.2861920-1-wolf@pi0.com> <2ec2efe9-b3dc-4757-85c3-528642ea57ff@oss.qualcomm.com>
In-Reply-To: <2ec2efe9-b3dc-4757-85c3-528642ea57ff@oss.qualcomm.com>
From: Jonathan Wolf <wolf@pi0.com>
Date: Wed, 18 Nov 2026 08:39:23 -0900
X-Gm-Features: Aa3M54pPxvUAq6HMdagxpMC5cxexw9wJ5sM6AWKWY8bBvmK12hLzWm9b3yEHzx8
Message-ID: <CAByFygUwwTx514cAv-i+Nk3enfECtx4NeY-o5PXjGtqG0QYHug@mail.gmail.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: parse nested DBS/SBS capability TLVs
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	jjohnson@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review, Baochen.

I=E2=80=99ve moved Tested-on above the official trailers and added a warnin=
g
when parsing the DBS/SBS capabilities fails. I=E2=80=99ve also moved the
cutoff assignment and debug print into the DBS/SBS parser helper so
the driver only updates the cutoff after the full array validates.

I=E2=80=99ll retest on the Steam Frame and send v2.

Jonathan


On Tue, Nov 17, 2026 at 11:04=E2=80=AFPM Baochen Qiang
<baochen.qiang@oss.qualcomm.com> wrote:
>
>
>
> On 11/18/2026 9:23 AM, Jonathan Wolf wrote:
> > The DBS/SBS capabilities in WMI_SERVICE_READY_EXT2_EVENTID are carried
> > in a WMI_TAG_ARRAY_STRUCT containing nested TLVs. The array pointer
> > therefore points to an inner TLV header, not directly to struct
> > ath12k_wmi_dbs_or_sbs_cap_params.
> >
> > Casting the array pointer to that structure reads hw_mode_id as
> > sbs_lower_band_end_freq. On WCN7850 firmware advertising hardware mode
> > 5 and a 5900 MHz cutoff, the driver consequently records 5 MHz as the
> > cutoff. This produces invalid SBS ranges such as 4900-5 MHz and makes
> > a 5/6 GHz MLO pair appear to occupy the same hardware MAC, triggering
> > partner-link deactivation.
> >
> > Iterate the nested capability TLVs with ath12k_wmi_tlv_iter() and rejec=
t
> > unexpected tags and payloads shorter than the capability structure.
> > Use the first record, matching the vendor host extractor, and leave
> > the cutoff at zero when the array is empty. Only store the cutoff
> > after the complete array has been validated. This leaves the existing
> > hardware-mode and link-selection policy unchanged.
> >
> > Tested this parser on a Steam Frame with WCN7850 hw2.0, applying the
> > patch to Valve's matching 7.2 kernel source. MLO advertisement and
> > radio-mapping diagnostics were enabled separately. The cutoff changed
> > from 5 to 5900 MHz, the 5200/6135 MHz links mapped to separate MACs,
> > and AP-side data counters increased on both links during traffic.
> > No driver recovery or association loss was observed during the test.
> > An unmodified upstream kernel was not boot-tested.
> >
> > Fixes: 241d130f1419 ("wifi: ath12k: parse and save sbs_lower_band_end_f=
req from WMI_SERVICE_READY_EXT2_EVENTID event")
> > Link: https://github.com/pi0code/frame-mlo/blob/main/results/final-pars=
er-live-test.txt
> > Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.=
0_SILICONZ-1
>
> Tested-on: is not an official tag so we usually have it at a separate lin=
e before official
> tags:
>
> <leave a blank line>
> Tested-on:
> <leave a blank line>
> Fixes:
> Link:
> Signed-off-by:
>
> > Signed-off-by: Jonathan Wolf <wolf@pi0.com>
> > ---
> >  drivers/net/wireless/ath/ath12k/wmi.c | 24 +++++++++++++++++++++---
> >  drivers/net/wireless/ath/ath12k/wmi.h |  1 +
> >  2 files changed, 22 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wirele=
ss/ath/ath12k/wmi.c
> > index 75b259990..f43c9a359 100644
> > --- a/drivers/net/wireless/ath/ath12k/wmi.c
> > +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> > @@ -5781,11 +5781,25 @@ static int ath12k_wmi_update_hw_mode_list(struc=
t ath12k_base *ab)
> >       return 0;
> >  }
> >
> > +static int ath12k_wmi_tlv_dbs_sbs_caps(struct ath12k_base *ab, u16 tag=
,
> > +                                    u16 len, const void *ptr, void *da=
ta)
> > +{
> > +     const struct ath12k_wmi_dbs_or_sbs_cap_params **first =3D data;
> > +
> > +     if (tag !=3D WMI_TAG_DBS_OR_SBS_CAP_EXT || len < sizeof(**first))
> > +             return -EPROTO;
> > +
> > +     if (!*first)
> > +             *first =3D ptr;
> > +
> > +     return 0;
> > +}
> > +
> >  static int ath12k_wmi_svc_rdy_ext2_parse(struct ath12k_base *ab,
> >                                        u16 tag, u16 len,
> >                                        const void *ptr, void *data)
> >  {
> > -     const struct ath12k_wmi_dbs_or_sbs_cap_params *dbs_or_sbs_caps;
> > +     const struct ath12k_wmi_dbs_or_sbs_cap_params *caps =3D NULL;
> >       struct ath12k_wmi_pdev *wmi_handle =3D &ab->wmi_ab.wmi[0];
> >       struct ath12k_wmi_svc_rdy_ext2_parse *parse =3D data;
> >       int ret;
> > @@ -5840,9 +5854,13 @@ static int ath12k_wmi_svc_rdy_ext2_parse(struct =
ath12k_base *ab,
> >               } else if (!parse->htt_msdu_idx_to_qtype_map_done) {
> >                       parse->htt_msdu_idx_to_qtype_map_done =3D true;
> >               } else if (!parse->dbs_or_sbs_cap_ext_done) {
> > -                     dbs_or_sbs_caps =3D ptr;
> > +                     ret =3D ath12k_wmi_tlv_iter(ab, ptr, len,
> > +                                               ath12k_wmi_tlv_dbs_sbs_=
caps, &caps);
> > +                     if (ret)
> > +                             return ret;
>
>
> better to leave a warning before return
>
>
> > +
> >                       ab->wmi_ab.sbs_lower_band_end_freq =3D
> > -                             __le32_to_cpu(dbs_or_sbs_caps->sbs_lower_=
band_end_freq);
> > +                             caps ? le32_to_cpu(caps->sbs_lower_band_e=
nd_freq) : 0;
> >
> >                       ath12k_dbg(ab, ATH12K_DBG_WMI, "sbs_lower_band_en=
d_freq %u\n",
> >                                  ab->wmi_ab.sbs_lower_band_end_freq);
>
> to follow the convention, would be better to move the sbs_lower_band_end_=
freq cache and
> debug print into the parser as well
>
> > diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wirele=
ss/ath/ath12k/wmi.h
> > index b508aa759..94bb6854b 100644
> > --- a/drivers/net/wireless/ath/ath12k/wmi.h
> > +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> > @@ -2032,6 +2032,7 @@ enum wmi_tlv_tag {
> >       WMI_TAG_PDEV_SET_BIOS_SAR_TABLE_CMD =3D 0x3D8,
> >       WMI_TAG_PDEV_SET_BIOS_GEO_TABLE_CMD =3D 0x3D9,
> >       WMI_TAG_PDEV_SET_BIOS_INTERFACE_CMD =3D 0x3FB,
> > +     WMI_TAG_DBS_OR_SBS_CAP_EXT =3D 0x400,
> >       WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO_FIXED_PARAM =3D 0x427,
> >       WMI_TAG_RSSI_DBM_CONVERSION_PARAMS_INFO,
> >       WMI_TAG_RSSI_DBM_CONVERSION_TEMP_OFFSET_INFO,
>
