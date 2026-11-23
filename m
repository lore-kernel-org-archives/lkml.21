Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460462;
	b=OIMjxqo2fjJ+BpfNK59qQ03yzSjZLQBJMfF/tMxWk9zRGFUyRiQOHStC5+x/k5UgN2o9
	 0hi+oz1a2KFw52yTvSEyopG+tgELz4unNbfRq4MZds8KMtNbYRM+wMO14gac9cdXtW+EF
	 dmdEe9LuKTXh81xfNt65Wc/dfygUoyCV+ETU58MJ74cIU1ep8hilvyyo7wefhV1zlE/5P
	 BFGs3R+hP6WQqI/gsTHfsLlymdTQlUv8ij9/DrS4xCwE0J2wA5e8YnDccrFkUouSNSINj
	 tGqirH+ChVYOrn4VxgihCLTv5cOS3we7QiuUNqs2baHUVfvLB+pH6PZ5km+5K12x4QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pH/xf3kQm7acLfNhYZrfRJLXvU+0NBXvSnbGGfIqejo=;
	b=3UV+XNVNIIgBgRnGUZQkSjuaDUi8X5RLWr6y7+F0BqHP9kR0ONXsgQ1Wcf5H+K0mfRb2
	 fluPTUw+MNWRquduraHutvk45kxn/SBzURfbIiJkdGVVwV2Jl0KZ4DNZfzVvsXmbW2A1/
	 2Zg5jGg/wVYaOGSqFkQSzti5AfnDTE12KhJX/CnBeFJjMqjQ5gZeDFY8fugWkrErHi1G6
	 YJKRfG2fuvrVw/BByozKFhqUROHD2eVEBQjy3QemLWXX4Fz6wf/fIP8ACRm9y3FsPhzAH
	 OeW0EObRuvvDlsc3/dG5L1Vq3BX66Ix3mQ+X+ag4882ghgtqLIAuii/BtwALfEaJ30g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UIVf1j3z;
	arc=none smtp.remote-ip=209.85.160.71
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770A2606A688
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 770A2606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UIVf1j3z
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4ab90cdf747so5831535fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795460461; x=1796065261; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pH/xf3kQm7acLfNhYZrfRJLXvU+0NBXvSnbGGfIqejo=;
        b=UIVf1j3z+zjne00h5XU5FJQw5NdCjtV8YVOw0TETJae3oRPZyE5HH8g8PKsVTSbE0x
         nmGMcbJuRwa4Vo8ISo5v2OfQQGrD/9GP2mHcBAekSoDEJ7JnLRvmdYttzwKEQE2WLW4F
         +OLO66vivT+1BuZAyfNr7j0ESPBZzSj2mbGdBW1hnoBL7wEbhvyfKhcOF1jZrr7RR+PL
         pvCbtiJwzv+y1HYS2Zq2zILJ4wmRINXg//WTV7pXVnYC6076k5dIpxulJjj3C2Gr22Ho
         yqqLZ4XJIKdAd1dRI0Dus7rYy8X0lYMUIc/pfJXnEU5jFPtUjjAVj17/nx1q5t9BG2Md
         HBYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460461; x=1796065261;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pH/xf3kQm7acLfNhYZrfRJLXvU+0NBXvSnbGGfIqejo=;
        b=xg84T7AazgJNaKDOBi0fZ0UxuJ5opdXBRQhpWGVHNkki/vgQwI+B9vkknCwmlDRSxY
         R0MvGGEQgPs7W0++96+a/sCQ8N6yLcD0BV2UcKZVl5Z9BR+2bpCLOz9NFPOUYB/dwNsn
         Ohm//45kiGswbMMvLCw0fvKe+Hc2zh4D8b6jBlm+0RYPpX+lNmm851KUCMyy7JI4ZpXJ
         EjgG7CXwm6CEhaRC5P+QPRB9xR/GqOF6ilxK51IhTKZ2BsJ1HDPVf9kZtQ1UPbsYaXHq
         cWHft+iU6Og93UdBmwg+i+W1LUEVTF5E092NDo2HiYEvUON4OJ57KjsHDEbGJCDy8I8w
         Jrzg==
X-Forwarded-Encrypted: i=1; AL+hErEwfYGfeWrhPCnkAlplqzYw1B+dNYrfFH4wHuJLwEQiouovdKMU7eetRVzbyWinbqZ5UDjx892ngjThZnQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CthUunhK7JmlJKzI0uvmyfzkY+HqnhBCatpSskRyXGdGEm7UB
	FXC5IviPcK3gwd5qq1NHtqnALsN5LMR8oH8HImLDYSAqQ5uQtOv035r4j0sPQJNCJHGiwYNNC1t
	QmXcz7yV8uEw1SQ==
X-Received: from jajj12-n1.prod.google.com ([2002:a05:6639:18c:10b0:5fe:be7:9ab2])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:6d93:b0:4f1:5068:b93b with SMTP id 5614622812f47-5797bb9fad7mr10333977b6e.14.1795460460873;
 Mon, 23 Nov 2026 11:01:00 -0800 (PST)
Date: Mon, 23 Nov 2026 19:00:44 +0000
In-Reply-To: <20261118223704.3286085-11-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118223704.3286085-11-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123190045.2166865-3-dmatlack@google.com>
Subject: [PATCH] fixup! PCI: liveupdate: Adopt ARI Forwarding Enable on
 preserved bridges
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alex Williamson <alex.williamson@nvidia.com>, 
	Alex Williamson <alex@shazbot.org>, Alexander Graf <graf@amazon.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Down <chris@chrisdown.name>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Fix the comment in pci_liveupdate_adopt_ari(), which claimed that ARI
Forwarding Enable is always recomputed after the preserved devices below
the bridge finish. That is not true with pci=noari, where
pci_configure_ari() leaves the bridge alone, so document that the adopted
setting persists in that case.

Reported by Sashiko.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 520c7530475c..08451452fa54 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -938,9 +938,14 @@ int pci_liveupdate_adopt_ari(struct pci_dev *dev)
 
 	/*
 	 * Unlike ACS, only adopt ARI while the bridge is incoming-preserved.
-	 * Once all devices below the bridge have finished, recomputing ARI
-	 * Forwarding Enable yields the same result for the same device, and
-	 * must be allowed to change if a different device is hot-plugged.
+	 * Once all devices below the bridge have finished, pci_configure_ari()
+	 * configures ARI Forwarding Enable as usual the next time a device is
+	 * added below the bridge, e.g. if a different device is hot-plugged.
+	 *
+	 * The exception is pci=noari, where pci_configure_ari() does not touch
+	 * the bridge, so the adopted ARI Forwarding Enable persists after the
+	 * preserved devices finish, even if a device without ARI is later
+	 * hot-plugged below the bridge.
 	 */
 	if (!dev->liveupdate.incoming)
 		return -EINVAL;

base-commit: fd54e32f7903199e8acb2762dd2debfffe4501c4
prerequisite-patch-id: ac616bdf67b652da754c7b00a368613d345ae384
prerequisite-patch-id: 9c324eb4a47b659efcf7c0c8bb14acfcbf5d615c
-- 
2.56.1.809.ga0b61035b5-goog

