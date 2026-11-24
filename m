Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527001;
	b=2rZeSUiM52kWGib5Zw/GrhRmGjRTbXlMxR4tcqMnc69CZQgqdxICYSMzXnp1T879oOEw
	 AkMD7Gps/U28b/SxQ9FdHB7ToLX9lVs6whs7bGbC1f2JvOUgX6VBWHiETJctNXO8hbeeG
	 Fixf5U1orRyJc3Bny2AM2QvHaruoeVDQtMB+LH9fC+SAbb9rG+0U5mpCar3Al9W+LgLEt
	 q33GCCqeoHcWrgb6ibz/IobQ9osNS4zw8kKcysn1AcwIrK3SFTj5xgBJ/emjuO/3QqsPP
	 MArqd/Y1QUk/KjWTUWtdKPyI6JDLzu337CuN54gP9KaQ7Sdu/4ea4Kec+RE4qc+N+Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527001;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=HbHpUlOb1f43/quJqropjm+88ksUSksI9CVMWl4Gkh0=;
	b=EfF8WNyhhHqsY6zrpg4sFigEBaKpDNl0WFFo2SLiVS6Vz/0x7LZe80nKsRVmIKSQryax
	 rLFFN/I3RbM9SUj6uIiRJeBAVtyvVDp4V6gMfceZFNafwQzgKOizaqMOGkikhyUtYIWkp
	 NlRKKJwHrNxB+sVV6r7hb8tcyPwfN4IUxC9rWQcDBI24ib0/KZNqJgPTTaZcOEkTB9Ph7
	 t4l3YvH0RYDAoGNxp+Ltbclv2+DAaTkZ9FLEH/1+Ye0Bym7JPt5qErPdFN9+zac8TLBhv
	 tK7p7LYXH78o8f/o3cE44vypu5o53fyet1UvMKLKDBzjc25ZzRj6LkBY85y/D8q6rtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Bgv8oiC/";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NIDesLzg;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3F5606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D3F5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bgv8oiC/;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NIDesLzg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795526999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HbHpUlOb1f43/quJqropjm+88ksUSksI9CVMWl4Gkh0=;
	b=Bgv8oiC/wOGGzdLg3HSuOJpsgnTPXhS74tBAb2d78Bjr4BrKACFjG+xyR9SxW5vwbYJBLE
	Fo4Mfig4tEqqkUarXmWK4OOklf2q176AXofMpDILZTSeCf2iPvlPE4RERP5tb1AUyRGwkZ
	p7MFwLDui8OgJcp/7flaWC0s/RRW2N8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-i4xCBph4PI-yWnYLu9csSw-1; Tue, 24 Nov 2026 13:29:56 +0000
X-MC-Unique: i4xCBph4PI-yWnYLu9csSw-1
X-Mimecast-MFC-AGG-ID: i4xCBph4PI-yWnYLu9csSw_1795526996
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d322fbso654956385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795526996; x=1796131796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HbHpUlOb1f43/quJqropjm+88ksUSksI9CVMWl4Gkh0=;
        b=NIDesLzgePeW1RI0l9jKnJHf2IhnwUfrUG2lBF5y+GZLhZ8Z3Ie7UpBf6SP23F4iYV
         x2qvOckOntfNSX1HuCJ0VQoFYumN6u7TV8xuc40J42HiLZk/fq1i9FTtDmjBd2oau2LY
         PGHK8eItVm68NPPY+LdgsqeEgv2Sb4wQ7am7tALLiq3Bfjsg72hnAkEsD7NvRKDAGQa9
         A6WVvroMc+D7Tjo741ZXl4KdViQW8l3aAOD2YfJlq7hT1RbgByrpYDzs9hi0tUD7AJnO
         OqN4vluVGic+u3umCBsMQ2KT+1vD3Wgpd1xXw43e9B0EFg85cQ0i1uewBw4wW2w9EvFB
         tceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526996; x=1796131796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HbHpUlOb1f43/quJqropjm+88ksUSksI9CVMWl4Gkh0=;
        b=OvKNSLDRSbUF2y1t3xJlwwA5yI87TfQOxeFQTUpAFoUi/GL4J3a5ioT2Jsc+N+iDJ0
         sudGoCdtRUXC9kDUrH/J8udYMArofPdvODsGIzevEhWOfdDy3qljqfQ4Rc931w9mCYiW
         6sWIBXzCGS8zR7DcGCC5A8HSNsyWx7htBBNwRIbQwchy3bspzsNM1IaBNgRCgPvwxSYH
         lP99VghwwjCcEaY+Pq3o3JUcIXqR7HX4Rq8GOklyj9czsSyqXaRZ9muxhnQOw46mIRmX
         0X03mXLFuSYdT3DFCtEzLTDMn3Pk4lU2gJ1vttYiXLT3BI3vF2Ax+gC0Tk8oM6q/vTN6
         20OA==
X-Forwarded-Encrypted: i=1; AL+hErEgdJ+yM3kFZWpsuIkdW92IsBRZA5f7ZX3OyyiZLoKkM2DYUGpRHBRInpebHmPBvIWF1rNPJynr0OeaaVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VApCnCnmRJ8CTbVQ/8QWknG+9WoPvhZejTCrcAkTj3mnH0tQb
	eV8YbvE1gWkUJRamLVbdSyO1ObC/gl3GN8IxmhetsmbgYNh+gJJjCsrzd8PTLlT4W3fA/zxkBqH
	YInAOcgmcz9DCvoSay6SWgKBsBvim4D9jaV+bNJQEaKScCOi7k+VP8KGu7TPCRJqOgw==
X-Gm-Gg: AZFdTZcaxIB/N9KJRvC3lpst+00rHCovvvLd++kx9y1O307r2N88PoKHNV5KWUrV+Qh
	ffq1t1DnY6TKARPM9ErCX+Mhlt//IAjL2o23REgUBKBjiaKlLbE06U8r94ducknvXX5xhn26lt4
	kweFzhn+UJOmJe8O/PKGTgvaK7KNfscrIu4uIvjtFbc4/AoDQzA8D57U/AG6qNXqCCnFFEc8nZq
	UYwCkIOQ13D3mnDReh4apKlNg7MscIDAPopbiuVrO3p0GeJ/qteHe4giRNNJvs/c3yBv13j3MlM
	r2zkmHxFyDRdgOz5h2flCpA73xRTrzBUMxVOpa937ZgQsqAfIXVr1zhLCtvrYp2YLVbJWfrHNyb
	aSA13XkWRp8vg3e1Cx053lE31RATTqKfaMI4alrMYcd9NfF/MiEc2zZrTSt++jjwhYr8e4z+csa
	uMUcODNGZCGeH4Vd0bxT856as1uLaUHarMCDdFkbktZLuq95YQjmh16/WsMKWXG1yJ4V0wmmdeu
	Z8Tana1G0Ghoppj0kuOlX6k3KZwwKsi7E9LPSw2Gz0Z/G+U1bL/
X-Received: by 2002:a05:620a:4004:b0:949:7920:9d06 with SMTP id af79cd13be357-949bab0e640mr2535561185a.68.1795526995954;
        Tue, 24 Nov 2026 05:29:55 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:949:7920:9d06 with SMTP id af79cd13be357-949bab0e640mr2535555885a.68.1795526995359;
        Tue, 24 Nov 2026 05:29:55 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f1ee7sm1033930385a.28.2026.11.24.05.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:29:55 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: Daolong Zhang <dlzhangak@isoftstone.com>
Cc: Ilya Dryomov <idryomov@gmail.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] ceph: fix inode and i_filelock_ref leak on file lock rollback
Date: Tue, 24 Nov 2026 13:29:52 +0000
Message-Id: <20261124132952.2186886-1-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1795396934.6B039543.003.4jXp835gJkz40Rf@fangwg01>
References: <20261122193828.1324376-1-amarkuze@redhat.com> <1795396934.6B039543.003.4jXp835gJkz40Rf@fangwg01>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Daolong,

Thanks for the patch.

Reviewed-by: Alex Markuze <amarkuze@redhat.com>

-- 
Alex Markuze

