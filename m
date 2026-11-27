Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770710;
	b=hMFpGZPe9MJN6n91DrmQ/74LqZzcoIx1ADucDw6oecV9OWYvQvxczNOX7YX5SIaI5rS/
	 WAr/F0r1F1ua8gfccQymbKQTKxPmDTtVdJ0ImYm5o1CVjj4BT8jVheEpwKtFP+X5cPFlk
	 8asQouQR6bW0Zc4U0PVNEBOQMWehbDfisfQs/R0GeN8tHWBIEinkUbsouBuezDLDX9OnN
	 CGO+GdVmz9fVG1z1eSfgJzRq+fYcLiGLjwoXZUMTICChNAVvQWfc8rhGr79NrgchQOt90
	 N0JDX3k2TUjmLVdf5qVNH9N0rZC1W/I6B9tzQDranrNp+i/5saNHpntbRgA7C0bIViw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770710;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=KYv8xSJwG5HpoyohHqCmo+JiohLfJNH5RWZtYUbNyvU=;
	b=3MnfeapMkeRpoam1nMRATD0MAiVPNx0KCOQ2Rbvw+Tb0wrckKYzfaBrC+JIeD/Bv8Oy4
	 EHUmechdnkoUHFPnUX2tHp+LKWvCcGhDmB2A5Qppwdj/12Fke9YP6hVAbIH6fjQmNHUMx
	 4sQbMzEKPzjplk0yOPVKIgQPyGVIyfBT5RJ2G/IgNbJ9OKaTIlwZWFra1MOPTPrZU0NIX
	 IsoFbLTY374zDU2Kpu1iWPMRN0eZH5jlg3G4JySE1y+44/CSui71m/JAjAGFeF/MVEF+M
	 Qgk2j3r2w9qwKrv6igkW7CzD+yrRYpPBCUe7jqj9JBFZL4iCeLejaGv5uSaAdKAKw8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="cIZ/rdiO";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="DQg2/qcV";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF43606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BF43606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cIZ/rdiO;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=DQg2/qcV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795770708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KYv8xSJwG5HpoyohHqCmo+JiohLfJNH5RWZtYUbNyvU=;
	b=cIZ/rdiO5tuKDrezWxFJPtDsWcI8vrlrfxhaVlH9uMLe5Tav8AZ8FdTBbCcO8FADkHOfw0
	YmOoPbwh/2A18QNlb9jGhkD8dxD0I2pBkNy0mAbHCymGqjYJheSwJG8DYfpVz7AZFxGniB
	2yGz6BIbS9UGoCAQA5w9SNmYfsgf2Xc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-fS2UIBaKMfSo-CZmZ8J5Nw-1; Fri, 27 Nov 2026 09:11:46 +0000
X-MC-Unique: fS2UIBaKMfSo-CZmZ8J5Nw-1
X-Mimecast-MFC-AGG-ID: fS2UIBaKMfSo-CZmZ8J5Nw_1795770705
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso55232595e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795770705; x=1796375505; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KYv8xSJwG5HpoyohHqCmo+JiohLfJNH5RWZtYUbNyvU=;
        b=DQg2/qcVg36wwJAdrdEE7778GvKNUXbR/CLzEGvvm9pdjh0NmxuER5C/sxT8e2a+iy
         beuVjqf6oyL2ep7FpLAwcWzrRkI5f3oeL9D+kVPdjYrcfdscDm5yiuBEUpoYDlynwd1L
         aoFboG74nIuWCzy36PiHwqqbXtaH6m7cOLNqkQXTnlIAd96rdug+SAb0sb4Q3sTFn75A
         RWkAifTA6IXh2+mvVFVkWCre/GPwyUSUrJ3mzui5VH3eADkvyDqi3MA4hkCM+m2nIqHF
         gHhOrTJIbSJzfMY9Wsxf3LeySlhFl7M5TncYUSWmB2bE4t21oL4PkFgzUuiofvEPHR7H
         b7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770705; x=1796375505;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KYv8xSJwG5HpoyohHqCmo+JiohLfJNH5RWZtYUbNyvU=;
        b=a5fr+MXJ7zw3rr+QEFNVc8lVOF9/zRToOTC3LmhfINEZ9wjnBfgB25cQhN+I5/1Jir
         Nug6dCCpE0AqYgXGPEojxTXows9YBV+68CwYuZbOMDBJidE3pqXRWnV9muwrnHiXuCqt
         +k4oLS8K8eEvamTD7Q8wtn/oqeyHwTGNr/XMZF7kjmj5EmZuuF1JY1KJy71iutbFt2Mb
         Nxn55EJDL7m+Z+/6umhIw27Mzy9loOWPuJVzUSAtPppfbYefOJBet33AwI2a/Lwi2H3G
         o3fjTWnbHejC2gT4oMiqevUFuZJN+TQqeHqp3i4cDMmGmTe1lEgiIKDV9IJMMGH1TfbY
         xAfA==
X-Forwarded-Encrypted: i=1; AL+hErECJYthZXE/+UFNDqtcymvjfj6onvatr/c1AjUu/0uSx9znFNI5oLkJ9iQyQGWb6beaIIGRxuY/+/x4kF8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fhLAe4q8k9MCq4dxPhmb+E+Tqh0SFfc1lDlruU6rjTzPzIrdC
	H0axuNgaNEOW1q42chRs+wWHAjfGpLV3K2kNOUM67rwMpBGGtaIDEqqAGdLqow2yf/brQdaT0bP
	pqGxyCpr5DZ9OjcEs4H38w7N2Wmrk5ANxnMF/y5EQR+wGi3xrhBCajgeiKkiImb0qiw==
X-Gm-Gg: AZFdTZfLhlmkUg70JWzlyo8Qf30OzS7NtSc0BQNfZIjNAM4lCx+0D4EfuQjXWlmc1K7
	44KztQS/2hTPeSiNyaMnZsk+B0nlmnIhqc/poJ6Kv1eu5aniJmcRTLc3DUNJbziObjE0ZP9Y8kr
	OCk2CWiSVQuR7MLs1SgjoAjodAsKC9z8avofx6sL8PVjbfVO81Wg9ob3XtMEN9mvhex9qRO4Rsg
	Tr1Fi+xS6NFVf1XPdrX724dGOW0x07lnu6SOGY7db1ktkEkrRDpheZ7WFzhsMX8SfoGVBBen9Jh
	Eaq5GG55ucw5hRg1WSkxW8Fb9dHMMaaOWoQmvO8NnZ5360fFppR7Umzlcxkr2oWfdUFuZoPi0Ou
	9UsQKAlPIznJv4XKIdWdfINhMo+cWxF4IKR8DV9bh6YufJAFPxvhEOnwt21xE8cE3YOk8ujmBEe
	WN
X-Received: by 2002:a05:600c:1d8c:b0:4bb:5345:606b with SMTP id 5b1f17b1804b1-4bb8882358dmr473340405e9.31.1795770705338;
        Fri, 27 Nov 2026 01:11:45 -0800 (PST)
X-Received: by 2002:a05:600c:1d8c:b0:4bb:5345:606b with SMTP id 5b1f17b1804b1-4bb8882358dmr473339795e9.31.1795770704923;
        Fri, 27 Nov 2026 01:11:44 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm614629245e9.9.2026.11.27.01.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:11:44 -0800 (PST)
Message-ID: <c28787b366061c55ea1849680703fa0bab1a0fef.camel@redhat.com>
Subject: Re: [PATCH v4 3/4] rv: collect per-edge dwell time for per-cpu
 DA/HA monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: Tobias Schaffner <tobias.schaffner@siemens.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers	 <mathieu.desnoyers@efficios.com>,
 linux-trace-kernel@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 rpm@xenomai.org, jan.kiszka@siemens.com, Shuah Khan	
 <skhan@linuxfoundation.org>
Date: Fri, 27 Nov 2026 10:11:42 +0100
In-Reply-To: <9a1df2a6-27fb-4029-866d-c115d9f0b5f7@siemens.com>
References: <20261127070545.64265-1-tobias.schaffner@siemens.com>
	 <20261127070545.64265-4-tobias.schaffner@siemens.com>
	 <6ee9fd02caec10b09c8f25913a2c0e619f5dd4e7.camel@redhat.com>
	 <9a1df2a6-27fb-4029-866d-c115d9f0b5f7@siemens.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-27 at 10:03 +0100, Tobias Schaffner wrote:
>=20
> Fair. Sorry for not having this on my radar.
>=20
> Do you agree that 3 is the cleanest option? I would prefer it over
> always having one wrong sample (option 1) and making sure that no event
> slips in between start and reset (option 2).

Yes, good point and agreed. It also compiles exactly to your previous solut=
ion.
Feel free to shape it the way you find cleaner and give the new function a
better name if you see it fit, but you got the gist of it.

Thanks,
Gabriele

>=20
> Best,
> Tobias
>=20
> > What do you think?
> >=20
> > Thanks,
> > Gabriele
> >=20
> > > =C2=A0=C2=A0{
> > > -=09da_mon->curr_state =3D model_get_initial_state();
> > > +=09da_mon->curr_state =3D state;
> > > =C2=A0=C2=A0=09da_monitor_init_hook(da_mon);
> > > =C2=A0=C2=A0=09/* Pairs with smp_load_acquire in da_monitoring(). */
> > > =C2=A0=C2=A0=09smp_store_release(&da_mon->monitoring, 1);
> > > @@ -276,6 +278,11 @@ static inline void da_monitor_reset_state_all(vo=
id)
> > > =C2=A0=C2=A0 */
> > > =C2=A0=C2=A0static inline int da_monitor_init(void)
> > > =C2=A0=C2=A0{
> > > +=09int retval =3D rv_edge_stats_create(rv_this.root_d);
> > > +
> > > +=09if (retval)
> > > +=09=09return retval;
> > > +
> > > =C2=A0=C2=A0=09da_monitor_reset_state_all();
> > > =C2=A0=C2=A0=09return 0;
> > > =C2=A0=C2=A0}
> > > @@ -287,6 +294,7 @@ static inline void da_monitor_destroy(void)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0=09da_monitor_reset_all();
> > > =C2=A0=C2=A0=09da_monitor_sync_hook();
> > > +=09rv_edge_stats_remove();
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > =C2=A0=C2=A0#ifndef da_implicit_guard
> > > @@ -689,9 +697,11 @@ static inline void da_trace_error(struct da_moni=
tor
> > > *da_mon,
> > > =C2=A0=C2=A0static inline bool da_event(struct da_monitor *da_mon, en=
um events
> > > event,
> > > da_id_type id)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0=09enum states curr_state, next_state;
> > > +=09da_state_t old;
> > > =C2=A0=20
> > > -=09curr_state =3D READ_ONCE(da_mon->curr_state);
> > > +=09old =3D READ_ONCE(da_mon->curr_state);
> > > =C2=A0=C2=A0=09for (int i =3D 0; i < MAX_DA_RETRY_RACING_EVENTS; i++)=
 {
> > > +=09=09curr_state =3D da_state_of(old);
> > > =C2=A0=C2=A0=09=09next_state =3D model_get_next_state(curr_state, eve=
nt);
> > > =C2=A0=C2=A0=09=09if (next_state =3D=3D INVALID_STATE) {
> > > =C2=A0=C2=A0=09=09=09react(curr_state, event);
> > > @@ -699,7 +709,8 @@ static inline bool da_event(struct da_monitor *da=
_mon,
> > > enum events event, da_id_
> > > =C2=A0=C2=A0=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 model_ge=
t_event_name(event), id);
> > > =C2=A0=C2=A0=09=09=09return false;
> > > =C2=A0=C2=A0=09=09}
> > > -=09=09if (likely(try_cmpxchg(&da_mon->curr_state, &curr_state,
> > > next_state))) {
> > > +=09=09if (likely(da_state_try_commit(&da_mon->curr_state, &old,
> > > +=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 next_state, even=
t))) {
> > > =C2=A0=C2=A0=09=09=09if (!da_monitor_event_hook(da_mon, curr_state,
> > > event,
> > > next_state, id))
> > > =C2=A0=C2=A0=09=09=09=09return false;
> > > =C2=A0=C2=A0=09=09=09da_trace_event(da_mon,
> > > model_get_state_name(curr_state),
> > > @@ -737,7 +748,7 @@ static inline bool __da_handle_start_event(struct
> > > da_monitor *da_mon,
> > > =C2=A0=C2=A0=09if (!da_monitor_enabled())
> > > =C2=A0=C2=A0=09=09return 0;
> > > =C2=A0=C2=A0=09if (unlikely(!da_monitoring(da_mon))) {
> > > -=09=09da_monitor_start(da_mon);
> > > +=09=09da_monitor_start(da_mon,
> > > da_state_entered(model_get_initial_state()));
> > > =C2=A0=C2=A0=09=09return 0;
> > > =C2=A0=C2=A0=09}
> > > =C2=A0=20
> > > @@ -751,8 +762,9 @@ static inline bool __da_handle_start_run_event(st=
ruct
> > > da_monitor *da_mon,
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0=09if (!da_monitor_enabled())
> > > =C2=A0=C2=A0=09=09return 0;
> > > +=09/* In the initial state since an unknown time: do not time it. */
> > > =C2=A0=C2=A0=09if (unlikely(!da_monitoring(da_mon)))
> > > -=09=09da_monitor_start(da_mon);
> > > +=09=09da_monitor_start(da_mon, model_get_initial_state());
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09__da_handle_event_common(da_mon, event, id);
> > > =C2=A0=20
> > > diff --git a/include/rv/edge_stat.h b/include/rv/edge_stat.h
> > > index 8b99e8520e1e..16c28aedabdd 100644
> > > --- a/include/rv/edge_stat.h
> > > +++ b/include/rv/edge_stat.h
> > > @@ -145,7 +145,10 @@ static void rv_edge_stats_remove(void)
> > > =C2=A0=C2=A0=09rv_this_stats_file =3D NULL;
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > -/* A zero timestamp marks resets, which can run on a different CPU. =
*/
> > > +/*
> > > + * A zero timestamp marks an unknown entry time: resets can run on a
> > > different
> > > + * CPU, and da_handle_start_run_event() starts in a state entered
> > > earlier.
> > > + */
> > > =C2=A0=C2=A0#define da_state_entered(s)=09da_state_pack((s), local_cl=
ock())
> > > =C2=A0=20
> > > =C2=A0=C2=A0static __always_inline void
> > > diff --git a/include/rv/ha_monitor.h b/include/rv/ha_monitor.h
> > > index 6e1c7fe5449a..78d1bb80aefd 100644
> > > --- a/include/rv/ha_monitor.h
> > > +++ b/include/rv/ha_monitor.h
> > > @@ -312,7 +312,7 @@ static inline void __ha_monitor_timer_callback(st=
ruct
> > > ha_monitor *ha_mon)
> > > =C2=A0=C2=A0=09if (unlikely(READ_ONCE(ha_mon_destroying)))
> > > =C2=A0=C2=A0=09=09return;
> > > =C2=A0=C2=A0=09/* Ensure consistent curr_state if we race with da_mon=
itor_reset
> > > */
> > > -=09curr_state =3D smp_load_acquire(&ha_mon->da_mon.curr_state);
> > > +=09curr_state =3D da_state_of(smp_load_acquire(&ha_mon-
> > > > da_mon.curr_state));
> > > =C2=A0=C2=A0=09if (unlikely(!da_monitor_handling_event(&ha_mon->da_mo=
n)))
> > > =C2=A0=C2=A0=09=09return;
> > > =C2=A0=20
> >=20

