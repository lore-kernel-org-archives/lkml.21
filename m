Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443629;
	b=4PmmStJZuLXqdmML3CjuJ1PXBSH8DyKi3d69GQubSjR7hqcmQQbR0jWnCZHWmMxi25iz
	 qHqGZau9Bsi9sIe0J2dgWi7/LQ4ejY0UaM6T189pDUoZgcNN45YTCer8VnRMsUaz9Tjia
	 n+iSdqB6OO6vrr8HgJWOcZUk2hYAevGY4hbFpcAHCNjjDTzlfMvziBUzraWZx9diQyvnq
	 vmzTPZ3PK/lu9XOYkDd/+j18TWfHt1/87Bb3hmV2q3JPI1xWHSfNsdbmgQbY/BGFX/K6Y
	 K+XexNi7Wjo/A5FTxRryrI0jWC23HiBGUv5yMk1yqvEKUp3Z2f0tTt/dwayQ0ZUT34g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IAzQq1DJpSBO+XxRF6Vp7LxmR7KfxskrkHM0HAoL/tk=;
	b=KnZRgum5nNpsvvVljnz/I/oz9g11AvaiI6ieSHfBXUKBB9I52n1SQ5Q85gfHQEcPqvB0
	 IqmVMnmrQOjLQmHxq8ACCpydVLdv+bux0C7D6iZvV9/xLWbepPvT0cDXWSgXfW+jyOt2b
	 dRrYfKujHXSxApNGaEMQZMlsVeuUjESvuKwYyLiqlFmsbTrC2YsCrgghAtaoWxtjpdkjg
	 +Tttp2UFbsMbf5arSZ5Cjk45bguoEULcndkMUV3xqGxEHNdyFOfWYEMg12UkiGaDba53C
	 48hMVdcT4olE9SmGmW625lAqPX11iI7ytkQCALt3wvK9/23/6/JA5LVZ3VSKn1kSMEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rnxolo2A;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F978606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F978606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rnxolo2A
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38644aedba1so4958271eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443627; x=1796048427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAzQq1DJpSBO+XxRF6Vp7LxmR7KfxskrkHM0HAoL/tk=;
        b=Rnxolo2AuqFjwFHQ+ncS+zjZac5WVgLKB3nOM4CSR3T9FDIDv7sbwyjTEj5hWzhdxq
         xks25cmqtbYvlu8pfcnMyKhJdaDLA7DlssJYIWc5hHVKHaXekAoXadx/Tfu5YmZSdgB7
         L6w+fIr5K6djLsdfZaD6eudvcnlupRy4o6JNHgT/cuWMNIEMXmGVkpDZJHt0/Lg0ZIMo
         VrcwmmKkBYmb3+3iL+bMJP3mTdocGjsdXDl1fC+3jmTt6oTI/ye3zP6uqYwUCSlT9kky
         H3Ncrua4lKRImP6N56ldnTmIOhH98p7y33ShuJ32kwRSBkqHTWGvwS106bvUuklfj3mU
         v8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443627; x=1796048427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IAzQq1DJpSBO+XxRF6Vp7LxmR7KfxskrkHM0HAoL/tk=;
        b=JpfDs5RQmoTYV8Xb6pJwGBFgVEZGqZkRs/2qKuksU/nVcswd54Ok3+mXj1VRzv3ula
         munWa4kslwJzzmAr+FMC4FV1osVcU9gQg9pAigBiM7ZkK8ECq77MqX5k0/zNQTb6gFa+
         inLzGhW36xT9xvWLlipKf8ZLfKzIFEyFqKlzOU28jdVYBiBHif60EFsmB6R4VnUgvIoB
         R/0VCknqAKOgMEDk0h8C/OyMBuo8E13yIDeEX9JhXEFf8+lSNzGX39ctIQsFX630fRXr
         AfiB3d/Wq4NFG4Ub5LFWLG+LwrYUyfAwwsf3Bx3mREyBNYGjq8/YM5sha+dSuWCZAR16
         06OA==
X-Gm-Message-State: APuU4Z/f1UKEnkAdE2+fXYR06xP7+hGCSDFNEfODg2xQ1I8BZAIEA8dA
	EPba9gctO09kOTCp7WR8LqO1PWNSd1mFv7BLONu8dOVu7ypY8S6D3Sf+
X-Gm-Gg: AZFdTZfQ/6ZWWwnLUndpcLu4C4D3QIn+/QZ3O0ukXRPns4XAbEKqcxBhNy7MZtKcJT7
	wBJGk6QugkwbDy7b4udbeuPQlj+BcXPGL4bg2hHr44oxA7ZXFtZmKLZMx7TA05GHn6UYD/HtoVw
	7cKpd+oUU+LwhJoMDh6FgazXDhaSWYFBBIqq4hFmYCHM1l9dIstwg7wl35A/HNGBdrrTeYObIU7
	WlratMQ6C3x5YtFbtnm+1G4Rio3h3VHU8VgAy2zZ4T1BfDnzsy9SOWyWX7baTFWHbLreWhW35B8
	qJs/DjkpOOFRhBhuCyQAqdEf6PQmeUew6rW4oijAr5tzspCljAYWyrpEr6SZz6dKr4nDNv7BAjf
	C+YIpTODfM9pWUM1ICNgnHv9dm/CJrpnFZjTp4/NrDja3fLJp8QkNpT/gAB29R50dppMGVO9JN1
	DpRIHCtVeR+t6wXN9kUXkUM3K/wmey5cgWDwVVpxufUfPFoIjGGl5CbedYj85JJqqiHvL5amd72
	nHi6EIRcI2IiqkQQKJZYPSytdGwsmOtzOdqTnnKkiYvY6uJVp8/qRpbJbgzO28nP1pK+EvCEbNu
	ba24Zp4rdSAZwN2sbJaJTmzcxHQKhFT2xGPBXj+jIDTLh+Y2zJTlhYJByZWbNoyMmwxT
X-Received: by 2002:a05:7300:6881:b0:386:9ffb:33b4 with SMTP id 5a478bee46e88-3869ffb51abmr7378341eec.33.1795443627312;
        Mon, 23 Nov 2026 06:20:27 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm3091208eec.9.2026.11.23.06.20.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:20:27 -0800 (PST)
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
Subject: [PATCH v5 19/19] mm/swap: redistribute queue readers after membership changes
Date: Mon, 23 Nov 2026 22:20:14 +0800
Message-ID: <fc69968abaa133c855fe71ee4394251e67b5d905.1795439990.git.lianux.mm@gmail.com>
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

Adding a device to an existing priority ring reuses the per-CPU reader
storage. A ring that previously contained one device can therefore keep
every CPU at the old common starting offset after peers are added.
Deleting devices or rings can likewise leave offsets and quotas that
describe the previous membership.

Reset the valid per-CPU ring offsets and quotas after peer insertion and
every nonempty deletion. Run the initialization helper under the topology
writer, which excludes allocation walks, without allocating new reader
storage or adding selector hot-path work.

Use cpu-id modulo placement for a fresh best-effort rotation across all
valid rings. This does not move existing slots or guarantee strict balance
for every active CPU subset. Mask and availability transitions do not
trigger the topology reset.

Reviewed-by: Kairui Song <kasong@tencent.com>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 91de93043500..f6a6df8c2595 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -495,6 +495,7 @@ static int swap_queue_add(struct swap_info_struct *si,
 	spin_unlock(&swap_queue_update_lock);
 	memalloc_noreclaim_restore(noreclaim_flag);
 	kfree(old_ring);
+	swap_queue_reset_readers();
 	return 0;
 
 failed:
@@ -567,6 +568,8 @@ static void swap_queue_del(struct swap_info_struct *si)
 			swap_queue_install_readers(NULL, 0);
 	}
 	spin_unlock(&swap_queue_update_lock);
+	if (swap_queue_len)
+		swap_queue_reset_readers();
 
 	kfree(old_ring);
 	kfree(old_queue);
