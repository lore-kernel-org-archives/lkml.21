Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443514;
	b=s7f8sUIyJ9CdqSSdZ4a0LOPUdlRSjnDYaaSRLO8R+IVToW5ZYhZbEhUTWddGlDFB4Cbb
	 aSM45IF2Y63bDdKA7FOBVCNHU6qNj+3PJNCeTBlJeWXk0PLBEzkk9OU20k2IG7F9RGqqt
	 pIZ4pNGBAn26bxEJIKwbmfAYAqzDJRy29nRaUHTZtfNpjffEJIqPiEGAZlBKbgMSGL85L
	 xd8oHlGzo9D77GhaQpWggWwmYYxiDt7hmn9zsgQjpcrCysxrMjEkcBt5QCM72LZvcNYwy
	 MgR7u/R1hLjyOcrJ2tGbQ0X98HNVRsXVlo8GbZEH9hab01G/m6tT1QpFzm8D6E/bnJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=phsdk8t17LQ5zdqcOPOzFghmL6S8vOZKS0iyfCAYlN8=;
	b=XK7NtrNAwNrKyfJ88eNt40fJ0hCJF8vrqO2G8ktqx6BxpMmJC539JLrqPQ42dkRXF6UQ
	 3J5Cc1MAyzIfOA4A1Ue05QAI7kXRoNB0MvrGFZvZ/0gBcAgOn5VPesXoYp0WgTvwUJnz8
	 ubxGjlDcLCwVq2mYnlhV/LndXg3Ii+Mhaam/mObiOxULPf844Ksc5fnZIsFdlGOQc9C7L
	 xScUkLP+ok/0othnHti8ezsjFpQX2Qf2tARdWWYVQQMIPysCCNBy1Tg33RxWGameZCCMz
	 mKiGYtL9T4EC5ei7VQGPe2Uq04AJDDF4RsG1HbzL3aWBop1KxYpBR7haFeGY84P1NGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uPhPqT63;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E45606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E45606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uPhPqT63
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15dd124bbe7so2089232c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443513; x=1796048313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phsdk8t17LQ5zdqcOPOzFghmL6S8vOZKS0iyfCAYlN8=;
        b=uPhPqT63Z/kUYm8RI/n60+78ArvChL11wK+GFtxUOEX/BSQuNGGOHPyfuOb9mAi0R9
         D7lOrzDGCsdNetndXtDYOFOzJuNKFFT8Wx00r0XrV4SjfiQaXQtjFvVA2+7WjEJhZTew
         5LhIySPP0b6jH+QAZl7wUjwSijlSp04dd8dKfvdX7Bbb5TpWKMEUfhIXNsZRTFIvR+pF
         FEspgWp5zJ4coo51Q6wKDSXKJ19xL5z1cbT+MRmT8/H1/jG3rcXMiODHpwai9gf+aCvC
         F9CCrXaT+nrxgsgJM9BiO5TnvF+gB0oNbVq86H9/3G38LC7Tk6qYPcxZjhRdMx80FiO9
         Om/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443513; x=1796048313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=phsdk8t17LQ5zdqcOPOzFghmL6S8vOZKS0iyfCAYlN8=;
        b=gqby7ADKR79qMHnwK13nAPh62bX7Pp+3Mun2Qd5EXJxvA3pbaLshgLrpswim2zV8Py
         o8G8PojYSQKn0jiKD1hhqrPLj3aiVvbCMsTO3R3N3aRrP70lPPn1OHstJfEF1ZB+UecD
         fG4ZBZX62a94HZUz/W+NUwzCIJM7hL++trhHYGTU7QbD46PXxWyP+Hy7fpsn3jhZvBes
         NuTBaD5skBpOfp7luUZwJo5p3Jf3JvPqyU1YcOrSyXTLQDy0TK7kGVFkQVg4Eiqe6QT1
         zrzyuKWUHnyES/U2IhySfgNtkh7M14tz4+bO/5si9Rgdbh+CAUn7u34b1dBR2J4hFyzF
         rFaw==
X-Gm-Message-State: APuU4Z+p26qHVBvHKJpbMpx0nDGVIRttG7n/0vLD5SO3WNvdN6PEdsrD
	J9w9O4UlwMKkYQsvtPzO8Aa0oYDGWBG3Cq84zLX3/CXXgxrLhnS07khc
X-Gm-Gg: AZFdTZdTyrh/R1ywtfCJ2I5jp/KS+Ga2M/f3/TGHhOfKS1tj5xo2+OHNI9TNLt3hli3
	PtZ1IJlFnVmSiGJjFvi7qVvlOsB9zaN75q7I6djOEQyep2Xk7bcXe5HpSdQt/2f4zZXKAe5oZOz
	Msh8GSGRYUK6xvi4DjVLQkCCuJ5rOMKbw+vDUqAV4uRO8t8hAOyg2VX0pV05FkP+DYQQL9oiWOi
	nJ3latmh8O56r0xKxHh7kJfbFw0Y+ZX9UaDfhmqsyEYs1i6NUWlfOvuZJ5+5XhI3iFJXcqWFJd6
	Pp3U/VmEX8xoRXDNsN/OINhRbA1i9NMV02U+P0Eo6YfG5TQz6Un06OU0bAlLHnlVG/4/N5blNQP
	QVgO8r/c7rAgEy5kCOCYhLZ87A0yWJQ+f5eX+DUhZ2Eo08Cx6s1TJxPB33PFWws0Re5ISD88dm9
	HCVU0WVc/GYRm172u37oAMdMX1184EZtDP0l6cLL3pvRyROJL2/FN80JDxOqfsc0ODNYHzafqpu
	A7HWQnTX2zX9VHo1ltXs39RA7OlBxZpxMs31FUKfW1yYA9Z5Cum5qhHiBzgrLudYII5aZ5ZlK5p
	/cvIPxv9wu3c2lce8PVPx391DtTNgwsxxT/B17AMNWp8Qhl7J1ZjSQGdTX5tmnTzSIq1
X-Received: by 2002:a05:701b:450f:10b0:1a7:78a3:bda8 with SMTP id a92af1059eb24-1b56f87ae87mr4467587c88.27.1795443512936;
        Mon, 23 Nov 2026 06:18:32 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm27824408c88.3.2026.11.23.06.18.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:18:32 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH v5 10/19] mm/swap: mask the off-list bit when checking whether swap is full
Date: Mon, 23 Nov 2026 22:18:17 +0800
Message-ID: <0d61898075921b05c626accfa34a60e16472b556.1795439990.git.lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795439990.git.lianux.mm@gmail.com>
References: <cover.1795439990.git.lianux.mm@gmail.com>
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

add_to_avail_list() clears SWAP_USAGE_OFFLIST_BIT with an atomic
fetch-and. The returned value is the old count, including the bit.
If a freed slot has already been allocated again, comparing that
value directly with si->pages misses a full device.

Mask the state bit for the comparison. Keep the cmpxchg on the live
counter so that a concurrent free can still make the device
available. This also applies to the existing plist allocator.

Fixes: b228386cf237 ("mm, swap: clean up plist removal and adding")
Link: https://lore.kernel.org/all/f53b388e1bcf6840457fe5041e989a3c0d0cc4df@linux.dev/
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 70913402a265..1ef5f1ead656 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1347,7 +1347,7 @@ static void add_to_avail_list(struct swap_info_struct *si)
 	 * that updater happen to be here, just skip adding.
 	 */
 	pages = si->pages;
-	if (val == pages) {
+	if ((val & SWAP_USAGE_COUNTER_MASK) == pages) {
 		/* Just like the cmpxchg in del_from_avail_list */
 		if (atomic_long_try_cmpxchg(&si->inuse_pages, &pages,
 					    pages | SWAP_USAGE_OFFLIST_BIT))
