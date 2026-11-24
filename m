Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528459;
	b=w+Mmf4aoe1SREHR0SMnjAS0ATHg1QuXnQaiDXxDIZHozoZgqPQDfu7vmb4aS1gtLoQXf
	 Xaynb24AoWQVkfNJ/M6NqhxDuWyHo+pHtxkTpCWLicvm3EtL6sB5OadRTaPaaYNYwThEZ
	 xYMGDrAQevRmB/zh1kyLOmZMwYf1sWYjFrXzigEy+FEaaVw1qyjgRDV7G329MJKrauOts
	 jsnmmlwQ1mtKjeuKj1HaTuQe4s/jqldtgQNwwbvTZMEaylgCR7/L4qFvQ7K8zePGcp3GY
	 KA+CSufQsCvz6NNUUFjTcfkMGyaTewhg79ZxzK5wgIExndGbGpbQLDGN5aszdXXFe+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528459;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=BTSuTvabptufqbTtra2OQo4b6Mm8L6DWa02Gs4EF2GI=;
	b=Oy4MiIUw0SmqY7yz7R7gDYr4ipDmA92tPpZ2PoGcoYjGNaDUSO8dbklGge3f69wlDdBv
	 R9w1zOfkEe6KhBiGGN290UUHpDMA5A3CLnp7A7BdXAbibnmuNv26tfgtfOsXjhn0vMuAr
	 2kaDx+zILVuY1VaRAD2aXMOjkGBgFTzSOR7kHI9tIQFScusHUmh89X33N7jfmbxC3p172
	 L3uYbXHxMLqxIZUvuHXVkqyLn9FuZwfx/ONzw72Sr9rhxSs1bkPfYmm9kPdYqwbc1XfoH
	 nyZU2uKiFiwCnaHKt7WdkgewlG7WD9DDAeNNF6R5u27PfJmbz9g+QbsOGo6XirGHEnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OINwf3Cx;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=klSRcYDL;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C066D606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C066D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OINwf3Cx;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=klSRcYDL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795528457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BTSuTvabptufqbTtra2OQo4b6Mm8L6DWa02Gs4EF2GI=;
	b=OINwf3CxUHhgl8E4WUeABLdIWSloOqV4KQnstIJ894e5+e1J9pL/i2hI5s4EqOVwchFKGI
	v0uj3ap/QXCzpUagoqlJ79i8I4+bHb8+fcv5+jXAo81f8CQLEP8qWXL8LMZBjX/25y3a84
	+uz+nj8zDFxF5b56ikh5uMlbZt7LJmM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-wu1-2a-1M5WR5bkIHCjEIg-1; Tue, 24 Nov 2026 13:54:16 +0000
X-MC-Unique: wu1-2a-1M5WR5bkIHCjEIg-1
X-Mimecast-MFC-AGG-ID: wu1-2a-1M5WR5bkIHCjEIg_1795528455
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b9095eeb5bso5853794a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795528455; x=1796133255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BTSuTvabptufqbTtra2OQo4b6Mm8L6DWa02Gs4EF2GI=;
        b=klSRcYDLBO18m1k2HJu95QlxqagYzaq7dvThtg+gCUK16pos4/R3hYLFyOe2I0S0Fk
         BUSHBLjR4tculnF5tpEjiETOHBLw6pg++jvybQqDdJkL0ZTDZTKW6GF0UvnWnVf6esXn
         yKsXnjQJZoQbITx/OpgtqF2qUK1MmrLT8UqsiPUfQ4XuzkxC4d5nNo10IjuW2KOw+b9z
         avAk/KNi1+GjkaoyTBEpUnSLfW2Tur2eldMP/ZJwIErsvAc64pliuwdGXwCkuKl9kjGf
         cYamUGzj6nqpJQgiVS+L0G3GYMC/Ly2CCX0aV5mpFJqkHmY/qEchNgOD7C6/c3FEPE+c
         qi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795528455; x=1796133255;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTSuTvabptufqbTtra2OQo4b6Mm8L6DWa02Gs4EF2GI=;
        b=xjJhDnxjvRvNE8pGbMwb+artutwZ/2za9ez02o+h1JqYixam/qroTHT2/pJ8OXpDn8
         VUp73nuaPNLN6ovGyMoQcr41KirAXgrscnnNBg+P7toiIVNtRFO+z2LShpzvVleKNKEb
         D5wVGuyQPpiPlOTBuHRRxroGnqeMUroHjJBy30f16yPxXrTI//a2LTCJdkSbuBICHlXc
         LnYF0zF388Vz5bFmKx/FdYL6UlqL5a/bweMOpw9/GOjVJ1VtJFbwBHzYr9z0n3RCXxyz
         dBw6zw+SR8rkegEeGE+nIj4fxSN5E+uTmyVf7DTJ6ZZ/zexOvRm3of6JZ5rMFY0HerSg
         qJ+Q==
X-Forwarded-Encrypted: i=1; AL+hErFpba5g1/P9MFUtiSw6QNLBi4DTXBqIYGPwsqKIvOaKT9dydcop1jdRn9moAkW5ncPy122c8D6fIQHAl0M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n6h6Uo+paLqccVD5gzg9tknRiEAja74lVd7Azc5091e3x+IeS
	yQEqlEkbGEvG+WpWZCXDuAzHXy6ZCL/uhbGLnJt/6BJ5z2NdXM2lmtscVHEsxAV4esPXciU1Lsq
	FL+G6pk83PAJ7K1FfhoAhlOVFYPhEo16U3IZ5qTiN5ftofuILiiAAUATLCLD3D87hBA==
X-Gm-Gg: AZFdTZdSkerhzNpdwLby4Vp6/4lyb7xHKezx+6VvANpqRzqj/kzyVv/2pL+H/jUTdlG
	08D9JjoF2+c45lOnsTc9jEseeP6/xvzlMYCZpq9Hz9rlpXSX+rajE87gAQazI2ff7mvJ3GpooDM
	Jx/qKcV/fcm7xWpGnyElYeuUfcRUavUu7ySdVf4ZAn6hAZJ3J7PIHD9piIjQQtKNfFpvE9J/C+E
	EbkOBEqY2pd1OqiGEo3TXLHsMM9l2DpG38WPTbEYvzraAsaQRoCOUd3va6SJCj1tGuruH9+F2/g
	OowMptGnXeX5roDTiWTYrHLSTgTB/WvrmZzrL6yzKPHfXydxm8lj0Tt4vW134LzhLcAY3guPj9R
	6rF4yuxT9KWtTJJetAXiq3KlCPVnje/UDeRHzjiefmCWdnqP5OVx/p7rQdwywISGkMkG4F+N1y1
	ZHTsY/spdiHjzDkLzskOo0Ugixopjsp1ksensG5DwQwPqz8zH4h35kUsXcF8P8gz5ILbK+JLA5i
	OxOB1yIPnaPoYZjyrYHmCDsv11JSyMl3a/oqgfMm5hGLuPKNwyh
X-Received: by 2002:a17:906:1651:b0:c50:6222:7b1c with SMTP id a640c23a62f3a-c513aaada4cmr976109866b.23.1795528455121;
        Tue, 24 Nov 2026 05:54:15 -0800 (PST)
X-Received: by 2002:a17:906:1651:b0:c50:6222:7b1c with SMTP id a640c23a62f3a-c513aaada4cmr976108266b.23.1795528454791;
        Tue, 24 Nov 2026 05:54:14 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea1fd8sm509052966b.38.2026.11.24.05.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:54:14 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: Ionut Nechita <ionut.nechita@windriver.com>
Cc: ceph-devel@vger.kernel.org,
	Ilya Dryomov <idryomov@gmail.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
	Xiubo Li <xiubo.li@clyso.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] ceph/libceph: killable sync waits and faster recovery after network disruption
Date: Tue, 24 Nov 2026 13:54:12 +0000
Message-Id: <20261124135412.2204051-1-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123080152.163172-1-ionut.nechita@windriver.com>
References: <20261123080152.163172-1-ionut.nechita@windriver.com>
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
Content-Transfer-Encoding: 8bit

Hi Ionut,

A normal final unmount calls sync_filesystem() from ceph_kill_sb(),
but ignores its return. If SIGKILL interrupts the new killable cap
flush wait while the MDS is unreachable, teardown can continue without
the flush being acknowledged. If the update never reaches the MDS and
the outage lasts through session close, the client can purge the flush,
losing a previously successful cached xattr update.

Please keep the OSD-then-MDS sync waits uninterruptible during normal
superblock teardown, including both sync_filesystem() calls. Keep the
sync()/syncfs() waits killable outside teardown and preserve the
existing forced-unmount abort behavior.

Thanks,
Alex

