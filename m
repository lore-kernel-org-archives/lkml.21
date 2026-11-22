Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371390;
	b=eVOSwA25p/MN+Pj/WVkcFFdlAS73ANOhr3AGcAh9lqB6AA7nvbcmmdBY6s9YT6EyID7u
	 Nl+4yzuAA5hBX6IG0cf/hEZoRqC9QXa9HN323AW0vAyyiOkq+n3l+9lh3stQiGVNjwi4t
	 mM4Ghf4a1+40JwEjmg2M8HF8qPNt1BizB4JYonu09Z/kO4HcED8ir6zJzzcOknrvqEUQU
	 RHhp8BTTtU0Q+c0+5/Ydd8+CBe+5qEe0HuE1GQcAXh8OvewfdZcZEKHWRZlcuidUqkSGi
	 1TxkIEQp/xxvnBHZyvEI2KlzKOaFMOQzozGkOlIsuqaqZU5g0C1z9QJwd3N1bcXk/vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371390;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GC86Rl5d7G64rmKwKqSKNiErJx76bLmpSfAVjHTh11g=;
	b=H2bQzesifj30NpPphOSXgvUL0m52QFtHtoCQEd5iOFYnHccE+MhpMavgtc+bX766iVJs
	 rbavJ9RFt2vHj3z1YT1vUOsocKG4mctECHL86kqNe52DM50EgHWmMSwIkZRBITJzM5V2a
	 zwBuKFayw45qHK3Y1evgRU2zDB9Jm5tasn7EHjq4S6aNUudOi/xMaF3Qlt1C8LYxQOOsG
	 X/ngBDwYPMI0YtIEzXqIfARhKomUFKNEx4TQ+LVf04B9qD9BzUzcU6p8dYrAs0LfLzmOz
	 2qXf4cf76Q+VClS4C0+LmH/UTnXP5+9CoJsGtgs/Ige1woZxMnHRN+oBk5l2tXHDi+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LGdntVN5;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rCxngTgI;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E0F606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2E0F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LGdntVN5;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rCxngTgI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795371389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GC86Rl5d7G64rmKwKqSKNiErJx76bLmpSfAVjHTh11g=;
	b=LGdntVN5kPk6z0Xzk3OiC5wQOYd9W6QMeYbOXQhNlQvb1SmoL5TI6+GHc5saXiXJztMszA
	qafBdgUqsdUEVBdycOuausw8XJwvhVwJZaU2v6r1SRozJzPCny41G7wzzginD+JX+pAOPF
	28NTH6lhRLctqPzLNd4kOZs4g+6zr58=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-VNbUu27FPNSKEDkuKCwpFg-1; Sun, 22 Nov 2026 18:16:26 +0000
X-MC-Unique: VNbUu27FPNSKEDkuKCwpFg-1
X-Mimecast-MFC-AGG-ID: VNbUu27FPNSKEDkuKCwpFg_1795371386
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6ba7b00b52bso1108325a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795371385; x=1795976185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GC86Rl5d7G64rmKwKqSKNiErJx76bLmpSfAVjHTh11g=;
        b=rCxngTgIyvjrvdeIyP27cmqJSxpMzxGriNTQdQ3Y+VnfGCo1B+/zfE4gLaY/xoIfqq
         qsYoWhNo3BRI2LGN6nvXJkh6y0iTy88u4zv7rHNQvmCxRQN2GXgNZKVgG0W/Qd/0u45B
         4sNWSjGdkw553JMqylmkeNevkGpyNjkc8aZS6OVoA44JIjf5xWk/lgilvWAmlj6CNfV0
         w5VPwe1R5RenIPKC/2xriQo0Jdz5q6tivUWD8gSaUykZDrzXV3frCYQX3jPZJoW29nWL
         0bVJ0hmoHusBqzfPwNB/VGtTOuRn8hGLNBnzsHeGWa/cs05P3JMrN7s8z/XcLiSB1duG
         xaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371385; x=1795976185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GC86Rl5d7G64rmKwKqSKNiErJx76bLmpSfAVjHTh11g=;
        b=Wtg43/wN1Z4RINWFuNfaqyhtjJPurkh5C2MBsI/7HwKVaZw2GjlwMXLDRsg+XAES+t
         TucazUElYgao9TI565W4PSlhJzW2X0Wqc2ggkz6h8zs6LODGDH1nTdJlgw1ndB3vID14
         ByWlfxZJ16dwc8M8tWSzg5kTQBPA7185KGBdUkp6Byg1M/biCa3Y7ARVUQsYvhxRtypK
         Fk8VLR48Y1oMDqjDBJ7cTnS5E3K1ZSG+72ztircP42DUCDlvBB6J+ePTU/9krP8y7GYF
         sxUzS0vZJqaz9R9RwURL7EZvqoVB1eNx9nLn8yDX1dosPX+ZKGOeZaSkCX+ClUdtOCif
         OFhw==
X-Forwarded-Encrypted: i=1; AL+hErFEVXDf7/CxLYxOpTWC725P5oFulmeE1cwOnGiWtjNv8sGX5lTSC/34rEH7LejxD7GfhCxVDbZTq7sgSNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eS0VwNT679RCsdFVOuBVOKCjvZNn+TLpGwcKD5U0mRsCjNNQz
	dlnwrMFA/qnxPpE710f/P9iAFVuBQdNFAy+3wM8QyQiK5JMbv/XlzvC6ft9uB4yq7fyBfwufy2g
	vdZMwjtkA8vXqMQEEZJ5nEghSYS76SnMjD1OmgSVePFOvzqef4kJy8MxgEGsvleoS3yS5++61uE
	M7
X-Gm-Gg: AZFdTZdbum1MoP0bR/CSbp+FLKou6tr/eHt2EOwHcepn9KJ6f3dOWSZi1pNttHs20zX
	wC4N/G2khcWKGEuv+Dyz5bsbOZtimrglHXg3k3l+BYi1gfGPFDMFFhYWRgjyvzEk6Lvez93mWLD
	VWhkgavHlBG6jKDwdz7fEq7TxOabwDCsCI4i+hzZywAetLsncTiWkSZcLy0bKBTkvYoqwgTkAZi
	dBF3NVjr3FT4yqZmzMoIVN2Yjd763L1LS7bNYE4xLXz/Id7WX8sKelCM1UQ1s96YA3J/OEFHrvy
	FaHNwEivANUz26xN7EPcclmLVslghDDHAUNUf5KAuxLx+O8BA43rqX6b+zXwWs8HrqDAWbsGSnf
	2W6C9W3+s9WC18dCUdn7arsw9dJ2n20qO3B1eZ1VKnIAUMh3qh1UWane5y+PjNsvP9Y/KjcpkNa
	hjhvRVrbmkSW2LLv3cjnfAcuWyAhnZG68UbtTWYI57rpfp9ohFAgELNRVt6+Q/d6vXjrJnr6evg
	7NuA5b4j8KRGfpSlOHgUeuLOkMvXK1TQYQoo0eydHlVFIMjVA3n
X-Received: by 2002:a05:6402:1e8e:b0:6ba:5993:cec5 with SMTP id 4fb4d7f45d1cf-6ba5993f458mr4312649a12.35.1795371385686;
        Sun, 22 Nov 2026 10:16:25 -0800 (PST)
X-Received: by 2002:a05:6402:1e8e:b0:6ba:5993:cec5 with SMTP id 4fb4d7f45d1cf-6ba5993f458mr4312645a12.35.1795371385314;
        Sun, 22 Nov 2026 10:16:25 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370faeeasm4410449a12.22.2026.11.22.10.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:16:24 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: Kaho Jiang <kj2864@nyu.edu>
Cc: Ilya Dryomov <idryomov@gmail.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	Xiubo Li <xiubli@kernel.org>,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+408fcc361565713f@bugs.sh,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] ceph: Use unsigned types for snapshot split counts
Date: Sun, 22 Nov 2026 18:16:22 +0000
Message-Id: <20261122181622.1294305-1-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113030257.1061200-2-kj2864@nyu.edu>
References: <20261113030257.1061200-2-kj2864@nyu.edu>
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

Hi Kaho,

The new array-length checks return through ceph_handle_snap()'s bad
label, which drops the message without fencing I/O. If the MDS sends a
malformed snapshot update, the client can miss it and continue writing
with an out-of-date snapshot context, risking snapshot contents.

Please fence I/O on these failures and use the same blocklisting and
session-close handling as for a corrupt snap trace.

Thanks,
Alex

