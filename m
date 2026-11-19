Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089781;
	b=U6g980MhgCHp7IpKueJBmavAP7BKkZnAsxPAoFNI1Ko7B1huNeW1zLXMj5ehopmgqadH
	 k0J0sUEoZhlvhiDYVummZXBtKyC9TvmolMC6uFd25mqKkKmhRPbt1i0xYWA4/+Sc13v0G
	 7SsumRf/645HiIe92yHtZEerWZPaC5Nx51DysjANIi6fqsw6JPwFBORt3caW4pzvVIRY6
	 NmKFJfoIKTV88I5lUOHZ7QK8gbUEmr8KfBWPkiVNBJiMQJNd3ji0B0vr6kDAUkweovaV7
	 VcB9MqMxoQU5I7ihRFY9ZsN17418PxJXwrf7hXeutu1Ew+FcISTGuznKyh7rHnCYo3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089781;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Mailer:X-Mutt-Fcc;
	bh=6K1VKlq2rUeTJU8oPRd92vsLkRSeWvDzIW6gRScpnDs=;
	b=GkLkdx6BPrhzEQW7cyRd1TYqK0c+uqSwt8wnpgo/EzVUcM4fMmK4HA9Z8r46H26n4BIC
	 kVDjJXQKffq86VJ2jZXXOAvH0fod3TaRXjAzNllXQPleO1h1iwYEorzZ/1YoxCfSg3mE0
	 A7WzsoiDoJHrjDaz4BcCnTzzh+P/IlrpO3+RdkvFoiL6JeN36OEqwr75YxLUX9fG+PJy5
	 uHHMWO02i28+fCOTC8v9DMDQyaA+c26wHyC1DYtdd7U+k4CHyL5PDMlY+HuC2udOjXi0H
	 HXUa02WbJbX/rDYkh3L76XHPa7ZVIwHyYbHx0aIIJeHvR/vy55bSDLzBPwhf+UCJOXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FNjiSuAg;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qaMjHRD0;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA45606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CA45606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FNjiSuAg;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qaMjHRD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795089780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6K1VKlq2rUeTJU8oPRd92vsLkRSeWvDzIW6gRScpnDs=;
	b=FNjiSuAgbkIWj2TZMnsyhzJy8QQfhm3Wxk7q+E4pG6vfYpqtYO2MZm11Jwq3iiNN0uA2gX
	BzR6O2d5XjcQRmIpMCbFY7JUGG+5qdM8QcX2A1Rh0xxg4tfcipOOMsSuWDA2jjGf/YsKjV
	k9xUCRpDEbNMJockOCxbVVkrhIoXsj8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-4odtfCtzPBummcUFdmpF9g-1; Thu, 19 Nov 2026 07:02:58 -0500
X-MC-Unique: 4odtfCtzPBummcUFdmpF9g-1
X-Mimecast-MFC-AGG-ID: 4odtfCtzPBummcUFdmpF9g_1795089778
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c51314820bfso30918866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795089777; x=1795694577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6K1VKlq2rUeTJU8oPRd92vsLkRSeWvDzIW6gRScpnDs=;
        b=qaMjHRD0azKh+AHVQ2fKtm3tn9ZPsq4JzphG+E58OR4M//f233wKR0Kh/ovJnnIoDk
         64jkYmJnVP1Yjkp6E+iUCHVQ+bGQfQlRXcsQRmQAshDx9IZKrel5MPPCsjM3xPgJ0qIz
         HsCI1rOCnKJ4a8SPUABunIIYVpO+x8sqX0lYz3EnOQsU1/vP32DaEKO8vTvLx20A2qiV
         ALO+cVdkZjbQRz0ydA1nTAkobWgRAq4kT06UfAZXqri5vSKRn00cGcZaxtE2qh1l2SFV
         FIiiGmu5k36oh3NhDPQAF4f82YRaEcNKhldnYlmGePL3EKFiXqB4NVRQlOligepXLcv1
         cScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089777; x=1795694577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6K1VKlq2rUeTJU8oPRd92vsLkRSeWvDzIW6gRScpnDs=;
        b=QJpdFlJqFV9DenAZfqDnVb9+1reg8Crg6DBHseUuW8sgaDNNLHlhiSwy8gj3dc1LyL
         SS/RDI4LTjIPCPO7vq3XDQagFefKckbzcN5X+fUEKMg8uecp9hJFPqzbpIaeJ4uwis8l
         yskn8FwrQYtIAympRqonOorC9fYb7vtKfvscEzwpbRW0Y3tudAB7vMKA0NsOKlTUDNk6
         QbwaAB5+zfOLwOHa3cKiMjhJGO3d43dajxrAepZFMl/Wz92dAo9dpiev0jV31eZAIOix
         tdDbHaxM7H8T7CSZZOdnBWqsmJruMDi/MrJm4RHsWQsoxdFUg0g2b+MmzGHDG9/BcGZv
         zHZw==
X-Gm-Message-State: APuU4Z9Hnl25TY2ZlJwcuJVRp2GSAJtrFLtrAMOOZoljbQGp+YVyC/AW
	RJmPVJz6d549Lb/0wI8Hmw7ngdM9d7R/4Xfv9R3NEWVSzB9tVvx3jGuXUbpamKcoNxmlEBRn3gj
	OSqqufN6aGqpEsqKc7EnNhc7qHjiJjIoanuoReBcDAI4+vrxrgcaosPbHMJdkGh4+9pRQR9mRv9
	TzQNwObvonnvw1cDkGpRi8yeHAsf/CLm9m1al+GjCpIIQ=
X-Gm-Gg: AYBFou0/ZQS46U4y7JQAt5Yvn6kYo/3NoqpRea0Ezbl6yk0XN2/vsbVpLgL8NmEK67Z
	Wcl5evlsjvrvvSZNsf49fo7KgGkQLbKB6QKBlHpNN6lHDC43/UKvCEvF+xFDVSxW44ttrjB/Nxg
	uN2ljQSMhrjvwolz4sbtaUeE1ukhsIpmfqKqB5vnb+E11gZKS7s/favXP8dQjYeMj/Z3RgglWy8
	NRxuJfBCH+4r1P1SkGbQjouyCfLRrRsQYIdyREL+ogZ3KBoDMKYsTqcSK2kmjsAPfU448RCbfwA
	2PFROQOKkwYIyF+sfl+Lr2pRH5Qu2BELkA2tgZPwIauswGDHsuZzrZdDVUiMxOyU1h1XWmWwnb/
	+X5A3u3VkXLufVgN6WVB/WfKIFL9uHs3UZTflpDg6a60=
X-Received: by 2002:a17:907:3f82:b0:c33:ae8b:817d with SMTP id a640c23a62f3a-c510e58fac3mr532075566b.46.1795089777393;
        Thu, 19 Nov 2026 04:02:57 -0800 (PST)
X-Received: by 2002:a17:907:3f82:b0:c33:ae8b:817d with SMTP id a640c23a62f3a-c510e58fac3mr532065466b.46.1795089776668;
        Thu, 19 Nov 2026 04:02:56 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1520:4400:d78d:7b2d:2f5d:e08f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6560961cfsm10496541f8f.39.2026.11.19.04.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:02:55 -0800 (PST)
Date: Thu, 19 Nov 2026 07:02:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Brendan Jackman <jackmanb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>, Dev Jain <dev.jain@arm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Gregory Price <gourry@gourry.net>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Lance Yang <lance.yang@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Miaohe Lin <linmiaohe@huawei.com>, Zi Yan <ziy@nvidia.com>,
	linux-mm@kvack.org, virtualization@lists.linux.dev,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v11 5/7] mm: skip zeroing in alloc_anon_folio for pre-zeroed
 pages
Message-ID: <0e8d142ec28ccfb548797652e1d39783046bddda.1795089715.git.mst@redhat.com>
References: <cover.1795089715.git.mst@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1795089715.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

Initialize newly allocated anonymous multi-size THP folios through
folio_init_user().

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Assisted-by: LLM
---
 mm/memory.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index ec3d9d99ccee2..020ae881b226e 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5479,15 +5479,7 @@ static struct folio *alloc_anon_folio(struct vm_fault *vmf)
 			goto fallback;
 		}
 		folio_throttle_swaprate(folio, gfp);
-		/*
-		 * When a folio is not zeroed during allocation
-		 * (__GFP_ZERO not used) or user folios require special
-		 * handling, folio_zero_user() is used to make sure
-		 * that the page corresponding to the faulting address
-		 * will be hot in the cache after zeroing.
-		 */
-		if (user_alloc_needs_zeroing())
-			folio_zero_user(folio, vmf->address);
+		folio_init_user(folio, vmf->address);
 		return folio;
 next:
 		count_mthp_stat(order, MTHP_STAT_ANON_FAULT_FALLBACK);
-- 
MST

