Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371957;
	b=ucQkbKPoMZOA3Wd7guJD0PlqApbJqgS/drNZLfs3nTkO0IPY6dmxs58T7G6u4xKbO8cz
	 Q+MU4TUcINP/u2GilQlYv5Vc0GgkK56PyUhSA5mT6ozoXVi+ornd7uXke50k29bNnE0o5
	 qyinkcwpx8/MId08nqZZqrrFZf+mK/bUugN4rZPPlu66AfkkNYGzWgWVrttmQtCHTiUma
	 aqtKnYNhWIK8heKd51IoGLhMyVS5vHgkUqJLPl2rTrRoPkMei3Vs+DmiW/i+XhIPxvQEL
	 K8+i8SdaYWR+4Cwpj7eE3IEdz8lOZGoQcc1aWy2FQsPPDf6vSBZp4vwuWCBhT0B8ZSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371957;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=p22DdnkyUJb36XAEAwjYj2yZLJPtAGtNNL8IeEy3sN4=;
	b=EGv9sbI6ndaB3RZ5kepn8vqCsVCbx8ST/uLmInZje7RWckYazrUHtFqK8wD4wggTjanc
	 BPhNbRFsZ2e7/CDETEKNc7bMcmXNBoSfQy+tsHb0ZfoenJE91LJl672vPHVpXXhqmx8hI
	 Y+3D+gnMIJ54xav0MXKJsKEZtkjNckQ5wLShXbnkHIrQHB7YsDsFPVAkEna6gJl7JVEhi
	 SVIQvDYExOQMoXL4H/DGe+FFIDaP8xoaO2fg/3LLXY/jsvuDf55aihFr2A6uOqKFjjV3c
	 68SP+k1MD8rM5vdoeHOEAr+CAhOrgq05y/k+EQBWtXcf5SCFB0FONMxIJmAMAY2mDgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I0nNlk4r;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="QSLBQIO/";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBB0606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFBB0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I0nNlk4r;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QSLBQIO/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795371955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p22DdnkyUJb36XAEAwjYj2yZLJPtAGtNNL8IeEy3sN4=;
	b=I0nNlk4r2UFuefZP5/FOAuRjd52WHakcIFQw/Y43IcvNHKTwaQramjAfKtVrdX5oLo2XUt
	aiKJ7D8Ug3BVAf/Om0o86GvCwGobruMvUfMf1IjA1nUqiVODRkVPEaSjpXelnci1EHaUWF
	h1NysMVY68arzBcVXcTkD3rhGkUBFGY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-BqJZNkDjNDeA6ukgPGl8PA-1; Sun, 22 Nov 2026 18:25:53 +0000
X-MC-Unique: BqJZNkDjNDeA6ukgPGl8PA-1
X-Mimecast-MFC-AGG-ID: BqJZNkDjNDeA6ukgPGl8PA_1795371952
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c5095dd1514so210752466b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795371952; x=1795976752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p22DdnkyUJb36XAEAwjYj2yZLJPtAGtNNL8IeEy3sN4=;
        b=QSLBQIO/ryxfybK+VRqGG+ZJkVFsYUaSvEg5k/9O79MmuPzGMENwQpQtuJsl00AgZS
         7q1Cd195aEg9R8XIIJjfNEpGEh3FskvVzmT8Ob5YoMakJnsk0w0asTFU9i24Ukl5wv6h
         MZYPXpnpy5n9ZxNzHVf+VRcTOTCnwzAJty3Zz/QKrUxb6FQVreJ8ARwquLipvmrsE2er
         dVH85pEENd3SoPaPD41qTPOCiVDfUPsYUBaIMs6nAcClqFEcHZrAp+4gZQbO8twMHxEA
         rCY8CbPwUk2AXuLPom0qR2k8KYRsGRZOcT+zSgnowsuB5TQ5kZfR/i4/Xf9NNnh8Iv5/
         Bp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371952; x=1795976752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p22DdnkyUJb36XAEAwjYj2yZLJPtAGtNNL8IeEy3sN4=;
        b=snmVNKJ87z1w1W8rQbqFdLsF92HDeqFPImAVf6qqvbOW4bnwb58A62RzYyO9TZZs9w
         5e1jgBYZR3isDWYY2XsjdHTpehHrpatnEg+CCCKBd3GV4p5sAadcuJpnyNL2htu915jm
         +tjNmBLkNMhLkZ2vKZRhFUOVOCQb915i2BKsT7Dp7YifDFXFlYJAExSsmrZE2yNnMCwq
         XQtSJeH+R3HDvphHAsYkSDDO2YHeD1Tf60otzRyr6naAu69cWeBr7m/Po+onu4LEY/J9
         3lxqedG/ciGjkFaUE51H0lbSz15U9XfMfnMYBj/TP5I0gjPs2DJbpdSN3EXZjA7X5yLD
         jQ0Q==
X-Forwarded-Encrypted: i=1; AL+hErHh4VaBi9XyI1/4E0om4J36gqn07PPcIHx3cwl/arzgqKZlgU5MkwZAl944AVh25PFYG8QNzlRIE/mI9po=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uA15mPybcPct4cqE35q4+h+NVf5ZI7++0E/R/BKVgB/ba0GJ/
	EpN9kKqRukXGO2w9sHT6NiVSTuslFUtDIrfRNjvpd/Pn7TTMoecmfMxfOBY4IhBaboEXWl87Y2n
	2kr2ytB327lZFmJlpS/kpnn2wW/q9rjDsOvh50tp3+Kn/s+jess9gh45xCqtxQkkN9w==
X-Gm-Gg: AZFdTZd83YoRo/yhwQzaQVObWoP9x2GDzJDgpRZruQeKoBXZl6XXjXPl8xOm786AQXa
	sYjB9oAa843/Sm/Qzw2icgHPclgyu9gZjxF2x2M7/X6J88tlcgClbeIg+n7eRi24PkZbVSYjg8Q
	/kTNXZfDziE2SSzxkdsn3m9vrGfeUwK+n1IB8O4jsXP99yyGgvG8sJhMTDQIWQUbW3hoQ3NNXlL
	lKbmrzHsbI0czA4YOG/IFVPLQ1cdIVfQ4vY48j+Td/Nyl/7kikH8JRWxceasCvDws/x6YhGrQnp
	r6SsbmcurcdCGIOzyUm80F2sgy9866A9e1OXiJIx34ZW/4iFkRYdn7YWe+pojNdh9Q4EamaxoOf
	goeBrb7wLl4c2oRwqN9FJnrHWuxKGYJaVGk9nVxgmTsY9qpcQoWkrJVd3/eN7qEF1gyVppUo8Bg
	6fBpalefWXhGgHGsCAOjx8wTkbZbwdn9D6OoWiqcOnBe/o1aqHHh5ONrKq4KhiP2vcDSjRMuoLp
	KkHfdg/oT+0KoshYaemG7fdQYPCs0fgpm1yrbF54YLeuBZnP2ps
X-Received: by 2002:a17:907:da0c:b0:c50:5545:b66f with SMTP id a640c23a62f3a-c513a803353mr696213466b.23.1795371952534;
        Sun, 22 Nov 2026 10:25:52 -0800 (PST)
X-Received: by 2002:a17:907:da0c:b0:c50:5545:b66f with SMTP id a640c23a62f3a-c513a803353mr696212666b.23.1795371952240;
        Sun, 22 Nov 2026 10:25:52 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68887sm339380966b.20.2026.11.22.10.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:25:51 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: Xiubo Li <xiubo.li@clyso.com>
Cc: Ilya Dryomov <idryomov@gmail.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anthony D'Atri <anthony.datri@gmail.com>
Subject: Re: [PATCH 0/2] ceph: serialize O_APPEND writes across clients
Date: Sun, 22 Nov 2026 18:25:49 +0000
Message-Id: <20261122182549.1297448-1-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261121-ceph-append-excl-v1-0-5870375edeb8@clyso.com>
References: <20261121-ceph-append-excl-v1-0-5870375edeb8@clyso.com>
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

Hi Xiubo,

The feature check happens once before ceph_get_append_caps(). If an
append starts waiting on an MDS that supports APPEND_EXCL and the auth
cap migrates to an MDS without that feature, ceph_append_kick() keeps
asking for Fx. With another writer active, the older MDS can stay in MIX
and grant Fw without Fx, so the append keeps waiting while holding
i_rwsem.

Could the waiter recheck the current auth session's features and fall
back to the existing Fw-only path once an open session is known not to
support APPEND_EXCL? That would preserve the existing older-MDS behavior
instead of leaving the write waiting after migration.

Thanks,
Alex

