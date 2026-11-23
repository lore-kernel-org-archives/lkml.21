Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443383;
	b=AOHKwWia/dBSq+Ss5sPS79RZUCc9IsyXTR8Mr6DfIynRjnkswPoD1Md9Rd92HGzcKSLL
	 qOJ7CoGANUK7Zpr1c/WRLg3dKkxHYdC104QpYYe70a1z25IQHjzz0tywRDm69P2p8qtaN
	 jYZ8k4N9LefmbcGD2q0kVHNuAKZ2+2CFCiewHA7BL6m780qVmnmOJXz7mEwkHk/MP4Zc8
	 6c4+AvroSPGVqNOyl78dS3WklMamv/upWAlYzSZnDoh8hSD0LBsNSsG6w9erZfjqXupWw
	 Sbx8mgiizMM7acLuUiN5Bj+jQvjEEBFlx+F+wXlACuqaeiW7DIYXt37pFwR4WxHDyng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6ieYUzrkSoXKds2DyD8v4HVQRsA87EwueP4G/any/Mw=;
	b=iIrH8ai/F/N7yUhI2YSTHjmO26RBfuhZR8ES1APh0idt+Pz+t1x3/pawRHdfps34POZV
	 CxUUqS6M82ra/vYPBTaQCtsAm7b8zBauq6Ufn3g590+1QNV30fflKcmWgC3XvLP490mFG
	 W60sQDqV1G/u7iQGlZkxnzN+nzWDaxdvUxK1ClNa6HamHpE7Tv+4UOArslmfkgAL5Nv3w
	 sgE26iHh5Rj2EgCN4xoS6Rlu2vffovelGgQjvPpG2m/2hdEvjjbDVLD0qi1xyyDhkTT1/
	 SMT4VEW6TPv6Wlpar8F/29DZA9hQMW214qdyfrKpXnu4G9Fx6GprXpBsU+dKt6I0Lew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sLD3hqjd;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698A6606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 698A6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sLD3hqjd
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38644aedba1so4948413eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443381; x=1796048181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ieYUzrkSoXKds2DyD8v4HVQRsA87EwueP4G/any/Mw=;
        b=sLD3hqjdh/M6/4CCDwHIErqc62yPh4AQ+IWjEASoSX59trn3LMf0OHqbf9v2mF22gC
         vwJLk3k33RD4TI/jBIuok1+RqPoWXnS+wQQLfNOwvgMH1ALc6Yvpa9GUMVviW81BosOf
         EiWgcy3uMMD2yEeNR4lcT3Oh9T71OltXpp+PxeWXyjfZubz22a5zkc6Gqm/bZUj9Klsl
         8YSEGjF+P/cVOm1gxW2h+/r4rjqj3e8B2+TpDQ4zicRY8zE0RV+zege0PpzF9ym8OOdW
         0RFdi3v5eczg62x8McWgQLa8nx0m7ZYD04cZETpoPaOPDYySHMYdNyagUkqaJEVtoKA0
         vdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443381; x=1796048181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ieYUzrkSoXKds2DyD8v4HVQRsA87EwueP4G/any/Mw=;
        b=lNI/zmYpLmojlbbej5P1QefPhyshOaFGMXWkT4/FoHdJdx5oV0QwOnQxXLXpxIx0bP
         4qWCcAiEZ8d+Gnw2s5XPgWWmf7Y0DReHwsu0n9RBLBNRzA0C53tAUruJyMHkQjPerV6y
         WawBp4XsratAG2BVBfbQckBXkSiiRD7SYdyOIZmxoC60sy510JHp3F1qy6eRwd0bn2Pu
         /zUNA8Rt5dN/l4NoNx79GZDOJ5bq4m3pV7uq68/iBmVxHSRDbQZ644gkxlEiTZXv3CN1
         k6dgL/sHWjxtfQcryGs0wpa3zzcW8X9cyvMR1Imhq3Iy1UMypIHSM+odN7ytIJjfvIfI
         1rnA==
X-Gm-Message-State: APuU4Z+REGYhVx6O6fvWov1FfjLfvmYqn8GLPazCyOId3k0Xq3Xnehj4
	yQH6t/9Ov8tGRrmQ6dZYyxY49RoQjGYNKtVgnMVaztQzBvIF5w1vcIZt
X-Gm-Gg: AZFdTZfkyHZfE/MSdoQ1DhOS8RBclAEI0EbUZLX7LfdsXsno7VQS/xrGH1RlfjLiiJN
	iZ97CfdphrXSozswoEy5woijvMG1xpMMomstTUMkIkQcJ0D26L4Wxlnuukd/P/Ys+IOG74eXS9t
	GhOwp2n9ZINl0EVVFYqrX0wX/QEwpNq4X6n+garlgFEWwzeB9QTskdaIj/vYYShwgY5XWta9NVX
	Ohi3Hbw5r3/PGfcm5wrMkNC76bGVw7JZySOBde2Cj3Li2JIIjOzhz0gvgr8JwamkjmXJHQktivo
	nGc0+9Y1jq80wEADyFujE6/7iC4DfNSGMWROZ8ZfErb8jfqCRBddTZgFs6sV7jGE1znPiotUAfH
	/rHeDLSV627dwZstlwh4gb+AvjIGwXlJNZ+4Dm1rDKec18kVZQ3NmCOXbbpEeIfP+Zm+RsEZ6uI
	ppQe1k3JOmRWdecStmetSelcik4xlCpwFSz96G0ch4Bs6haRMJZWwqgmB5aQY4vZk1nmzaKnuF9
	sytkIKqS2ucwjNQ+iprSjAMPtnKE1qrT4diMoOyfZ7vcj5mULb1B2GTFKLOaoRTWAXJ8MkNVyLe
	HKxlE2UvBGAgKoeJqWPveK9CkbzrzrsBmmIpBY1xKDxGyPySHjAJeQppTIYiBma0iIpw
X-Received: by 2002:a05:7300:8282:b0:385:af7b:d788 with SMTP id 5a478bee46e88-385af7bda3emr10635445eec.2.1795443381369;
        Mon, 23 Nov 2026 06:16:21 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm38349861eec.28.2026.11.23.06.16.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:16:21 -0800 (PST)
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
Subject: [PATCH v5 02/19] mm/swap: clean up hibernation error handling
Date: Mon, 23 Nov 2026 22:16:12 +0800
Message-ID: <3e8d55101602d5ec982ae636eaf5eb4dcaad3ba8.1795439990.git.lianux.mm@gmail.com>
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

From: Kairui Song <kasong@tencent.com>

Restructure the error paths in pin_hibernation_swap_type() using a
goto out pattern to avoid repeated spin_unlock() calls and simplify
the return flow.  Also simplify unpin_hibernation_swap_type() by
making the si NULL check inline, and clean up find_first_swap() to
avoid an early return inside the loop.

Signed-off-by: Kairui Song <kasong@tencent.com>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index c06f9f532e74..0ae901296731 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2331,21 +2331,18 @@ static int __find_hibernation_swap_type(dev_t device, sector_t offset)
  */
 int pin_hibernation_swap_type(dev_t device, sector_t offset)
 {
-	int type;
+	int ret;
 	struct swap_info_struct *si;
 
 	spin_lock(&swap_lock);
+	ret = __find_hibernation_swap_type(device, offset);
+	if (ret < 0)
+		goto out;
 
-	type = __find_hibernation_swap_type(device, offset);
-	if (type < 0) {
-		spin_unlock(&swap_lock);
-		return type;
-	}
-
-	si = swap_type_to_info(type);
+	si = swap_type_to_info(ret);
 	if (WARN_ON_ONCE(!si)) {
-		spin_unlock(&swap_lock);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto out;
 	}
 
 	/*
@@ -2354,14 +2351,15 @@ int pin_hibernation_swap_type(dev_t device, sector_t offset)
 	 * the same session.
 	 */
 	if (WARN_ON_ONCE(si->flags & SWP_HIBERNATION)) {
-		spin_unlock(&swap_lock);
-		return -EBUSY;
+		ret = -EBUSY;
+		goto out;
 	}
 
 	si->flags |= SWP_HIBERNATION;
 
+out:
 	spin_unlock(&swap_lock);
-	return type;
+	return ret;
 }
 
 /**
@@ -2441,11 +2439,8 @@ void unpin_hibernation_swap_type(int type)
 
 	spin_lock(&swap_lock);
 	si = swap_type_to_info(type);
-	if (!si) {
-		spin_unlock(&swap_lock);
-		return;
-	}
-	si->flags &= ~SWP_HIBERNATION;
+	if (si)
+		si->flags &= ~SWP_HIBERNATION;
 	spin_unlock(&swap_lock);
 }
 
@@ -2480,7 +2475,7 @@ int find_hibernation_swap_type(dev_t device, sector_t offset)
 
 int find_first_swap(dev_t *device)
 {
-	int type;
+	int type, ret = -ENODEV;
 
 	spin_lock(&swap_lock);
 	for (type = 0; type < nr_swapfiles; type++) {
@@ -2489,11 +2484,11 @@ int find_first_swap(dev_t *device)
 		if (!(sis->flags & SWP_WRITEOK))
 			continue;
 		*device = sis->bdev->bd_dev;
-		spin_unlock(&swap_lock);
-		return type;
+		ret = type;
+		break;
 	}
 	spin_unlock(&swap_lock);
-	return -ENODEV;
+	return ret;
 }
 
 /*
