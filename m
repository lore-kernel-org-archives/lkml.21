Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795379245;
	b=q5fdY9xTLpj7NeD2NuuKL0gAGLaBrpW3+4zpRPFGuPhaj69wSfAPrpviU/C3ZOBhonvy
	 Zi6p2URQocwUsbnqMsR+FqiFtASgy9ai6Pi6wR1YHnTDiabbt/EXdYNLzjJM2uQATp6hf
	 R7A8XEMrER7qSnWOBxdpteEw0Tnf7oUKsKeK3edBUA244ZRm5TERlxobHbgImOSyRqXlk
	 pNJGWGtfybQkdUUwtJGpZTs4X2mdGSidVBgwPDOkwfz1ZMmkCSETktks0qi/MgXCZ/wcW
	 b+sv9VFSrQaw0agcjQAaypHusovjYlpDizpU1RMuZo9Yy51d1lJu/z2bJB5Nemmb5Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795379245;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=sQDVuZluf8hD6XSUePZUWArQRh9PmFlRuzSAFyE+NUg=;
	b=TkrbTlDIsvX1nHapE8YMQeZKquStIXDjx3mwO3s3iGbzW70HQPLIkRQq3rsJckVXaO7P
	 jONIiG5Mr4S+l1YvDtkGphMtWsggNXx5EK5RYHPqI0orhOQM7C7V2hfSubxMxDR9NL9No
	 RsWVHdsWPItT17e9MxDZyo1Y99ZpnyBUYnTVq7SzLI2o/TJ7Fx0cZIfinVIrlOITg30dq
	 cfzZ8XG3J7uLb4h/nYVC7OvTv3n33VSdsq5kjQZ0qrFTY1E6FHisoIzti/DtFDadf16oV
	 o+or+8/SCxUAmun0Ek3LjCUjZNpg5Iyk8yYK0tCut4lc5XkK3NpJRlTGjmhzQtl431g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YYDKzCWt;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="LRGcPHw/";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B853606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B853606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YYDKzCWt;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LRGcPHw/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795379244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sQDVuZluf8hD6XSUePZUWArQRh9PmFlRuzSAFyE+NUg=;
	b=YYDKzCWtCuJ8q89nat5eQDhJYCYXkIxaa4bBj+kSFepP2eTd6dEhLqzyarD/5vmG3NWp8N
	WXgw1HM3iduALpzl3y+Fl/M/P1EbrRs7nxh7sjDk7W1bmkJdjgswpAyIc74KBK3aY8KF5L
	NsE3WQrYqIxZ87zPwiNujUWW4Na+S+I=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-bXvRKcvZOiSqYfH52OxopA-1; Sun, 22 Nov 2026 20:27:21 +0000
X-MC-Unique: bXvRKcvZOiSqYfH52OxopA-1
X-Mimecast-MFC-AGG-ID: bXvRKcvZOiSqYfH52OxopA_1795379240
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c508bafaddfso199062766b.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795379240; x=1795984040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQDVuZluf8hD6XSUePZUWArQRh9PmFlRuzSAFyE+NUg=;
        b=LRGcPHw/H4+m+odH3yKftlntTxHBu04oyLIpjZx/2Ho5eCVeNY5YZoMJAjCIkYr/53
         KJtbsrzSc3mKURMiXc7JrtDFpyhzpqhKoVkmnoVdf/nrqMWNDhmidY9kRmDNlczYw8f/
         Y829P8WUiNouvqkVr2ip6Tr0r6h+eGcBkEP/rdyNu9MFwYM20e6WwdlDOllE5vEhxBuY
         gbJGpxNBvHBPuzKaMsTf5a8zWsqN1DDAn/7V4nBXFH5dSSVUYDw9vnW+pEgtlm2myjbT
         GpkIJLXWDz8WGZAfz949octZuTgAR3PMZlWnJNhawSXZBKWDjHtKzLbpxzDtFW07Lxge
         TELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795379240; x=1795984040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sQDVuZluf8hD6XSUePZUWArQRh9PmFlRuzSAFyE+NUg=;
        b=BvV4oXZQLjsqjxF6aHxjp2Jj4bVcuw3FXG5TzS45J1+9VRQ+1p43rnuN4Y/9BLe3K9
         LKpCFHQTT0RFoovxvP0C6rrqPyf+h/RnTal1Y9ClxFVLWWH0f1UJEGhJyYXaW6w5HR7J
         KaQ5TWBXSCMu9cGK4zvnIgC9CMLTPJ3WbIOyCPZSb/dICKFDahBmoQIcLRamxEOZULyj
         DnfwwwusoP9inAtRr/xbJ50MvzvIAYPsJcpGD07ehvqF9PRJ6JfMyv5gFCoCodkPPiZg
         ET8fQI3XZ0t2/Jms/Ay/GbmumPTO3j/dqh60GfeD5DbZmb8M92EQNdqyTglPECu286rW
         T78w==
X-Forwarded-Encrypted: i=1; AL+hErEdWiEHkUfETMKOZOhfLnEZIXxeFKhwE0VHI+/pk1atgeEl0tqaORdHbkOGONH/XWpL87A/fJkNhb5ts2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Bktn5zcM9K7nr0Zssd8oExLLoFAfzaeYQvL7POQS5MBXZPjVO
	sAnjHxUU1BwxK/IMVV+hK3SAsL2VbaIQZbw2mCz4c/xhcdhmalMTolsmO6ufXOu07x7AFuhXELQ
	Wev9o2jlh9QGWrfr5usD7x+NQoSjQ0XneKDWwVy15e2QfUtd3bBa3eVIHGo1GcKPLIw==
X-Gm-Gg: AZFdTZen0P063BWKHqXen35gdrDrQuJUcoIYzASLFrxUT5KXGqXHzGOtUDSSGsCNao9
	zRZJQMNqb8P6KB9CeDi3dLWr8bgUjn11R183B5QrALLN7slil/3femmMib7xjBZur+0y8ulpc6y
	qr5Ya41VVHvXNmhWgsu8m42NawgVcHDck6MtLXwk8oRgoo2K0CLG3/A860r+EVVKea/NN0gs57Y
	2nIs7WLAVDEaIGyPQ1HfGZon0rEfvUShPt6BWQ/W8wbAciQpMKFX5P0U5hyEN9MRaRCLCJgwboI
	u+FsbwK7rV73u+ImubbzVoSzMC3l+7g5Jq2VBWBRdSXX+cqDRDgUumnHDIL0ggh2OLNG4EA9l4w
	OlQmqDtttOJ3mwRpQ5sBysaOS6PE/Hev03px51Vac27gGE6rmqKr0OsUYu+hWzEbqL/T1s2RgcC
	3bI1vWyzwpeAbttzTZWqGNr8TEhdJ+4HyXum+NBccO7zQKDiioCEOZZHJphTGC6xS4TZs2Va9UH
	NiHEI5wmbG5sDdGvDT1RXjBQpEfWVFuowCAjArLFPTl1kvLyyUL
X-Received: by 2002:a17:906:3588:b0:c41:6de7:7dee with SMTP id a640c23a62f3a-c513a3ab1a7mr548910466b.7.1795379240276;
        Sun, 22 Nov 2026 12:27:20 -0800 (PST)
X-Received: by 2002:a17:906:3588:b0:c41:6de7:7dee with SMTP id a640c23a62f3a-c513a3ab1a7mr548909566b.7.1795379239939;
        Sun, 22 Nov 2026 12:27:19 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae9f705sm342880666b.42.2026.11.22.12.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:27:19 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: Ionut Nechita <ionut.nechita@windriver.com>
Cc: Ilya Dryomov <idryomov@gmail.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
	Xiubo Li <xiubo.li@clyso.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] ceph/libceph: bound sync waits and speed up recovery after network disruption
Date: Sun, 22 Nov 2026 20:27:17 +0000
Message-Id: <20261122202717.1341108-1-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261120073431.53636-1-ionut.nechita@windriver.com>
References: <20261120073431.53636-1-ionut.nechita@windriver.com>
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

Hi Ionut,

The timeouts in 2/7 and 3/7 can make ceph_sync_fs() return while
requests are still outstanding. syncfs() can report the error, but
global sync() ignores the sync_fs return value. It can therefore return
normally while an unsafe metadata request is still waiting for its safe
reply. Both paths call sync_fs with wait=1, so returning an error from
that callback is not enough for global sync(). Please preserve global
sync's completion guarantee when adding these timeouts.

The default timeout in 5/7 also applies to the interrupt request for a
blocking lock. On the v2 base, if the MDS has already granted the lock,
the interrupt does not remove that grant. If the grant reply is delayed
and the interrupt request times out, the syscall can return an error
without installing the granted lock locally. The MDS can still hold the
lock and block other clients. The underlying grant-versus-interrupt race
predates this series; the default timeout adds another way to return
before the replies arrive. Please exclude interrupt requests from the
new default timeout.

Thanks,
Alex

