Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443599;
	b=aOB4KanLvSqdLVHIm9nn9u+pMhuaOnTtgI4jq53V58HHHbMUelui3HidDNwxnoWMlJpj
	 aXfTK+7hnScMaQJ/ChjgBQuWFn97Uub6PuxReFNB1mqg4GFYweVMrigbO510cQq8xKLoN
	 3/0qTp7IpFszg6hkZj+o0UMFMgCeD/Tjj23jZp92QDFOhJiQTCcPQOVmPiqkx2t+r3kUG
	 LJcWNk+NfqaVFdJsko9GkTxrehiLVk0qz1ut46l+CjmASNYh0CX13Y0qKdkijqNNgq829
	 afkRktyrwsmvI7k1sHWn13gaH1ThRC6QK3vgEOe3x7RMxLCUuX+LiagQioqeV6DaVhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y226DZkwLHV/0wLned+bdA2tSEyU1JvBKnaVWIVUoR8=;
	b=4PxSw1WNzrNr8I3zvFevvaZBFRwGEmN7T0rCZpOjoHHOE+5FA9+zKvyfeYfNNNIDTp8z
	 m3j99ZM6tPZDie4Qha9yEhhQxRufen2KxD0SqdJdszlV13UKHSdaPKYqbvgSGWHmA026Y
	 eArSb7VKJ6eBFoDaA7qFMq9anz2SlrwZjOuZa33qJs91ySW8AmdozjwR5QbP/jkoHF0UL
	 CqIhj5bnEC//oY1qgABCf/C1dZtqhIKLDC/OvLBgD/i4vWKUjJ3pN6rxw3Vm9GqNh495a
	 KiiNwKe2NABzpwrA0zxYh7hiug+i3hvkKc+5c/YLZ7B4NB9Llg7hAwfMkPU89oLu4Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="BkREXJ/B";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DCA606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72DCA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BkREXJ/B
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so4079945c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443598; x=1796048398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y226DZkwLHV/0wLned+bdA2tSEyU1JvBKnaVWIVUoR8=;
        b=BkREXJ/BXiDHJyUVu9BXVhXdtOTtx2gQC44oDHvVkAnLsroA70wEVDpoiTzJkhjAbD
         hQV5IlaaajhaDZiA/u41gVg0720axesf4RBXB0p4P66LmSjkszkkT3kkJYqWQ7p7sw32
         rDWX6hpEeTUw4/JUkLhIRrTEPHpqp0xjxRsw2qRU1UK9vOTeYzHXtMjo4Jg/FiHILvNu
         d4upBmFwjoFVgR4ZRGusk0HTg/0FiJeCw+HCSUqt7DYgXc/iMhGX61CXNGGc0kOae3xk
         ZIaeHM9/tFZUezu4yLK0RJC82OXvnmgAIyEdKyGgPjn9nywBSJbw+MwDcFXsupwH5v/i
         OJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443598; x=1796048398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y226DZkwLHV/0wLned+bdA2tSEyU1JvBKnaVWIVUoR8=;
        b=AMfTlQ9kg+iEq5SS3wJTJEKtXEfXgmRquIAs+PpgastfmFujKW67n+uautAS/FhKOG
         8w3ScM7eVgLAnVRhyCVYO5Ucy0UaG9PUisPFTjH44832e36tbOGliJed7jlZ/CDbxDjQ
         hwx5Ke3wLzsukc7zDGrZjJXPAf8MGxit5aT+P12s1O2EMyE0UlP1gFa4QMEUTidtvtLd
         ubXwm6c998PkdsRZlPM94CkfD9yxFB7qjivD3k/IYR37czzf2Lf0DHrZ/DUw6cMLi/8c
         s+hOYzF7peFILyJt9eVnh3Jnu6seU96wvH5bCg5SEbJOhrDl7HUeucKaXM2Rm88TP1P2
         P7Vw==
X-Gm-Message-State: APuU4Z8xSfFkoR/fhTirhr+Zp0022FTA2XwzIRwU5lfTvTkhwF4OBm/m
	DvQVAXlQUjNMH3+tNXfhDXUZveE5fwoxjNIFKuZRv2aGRL3c4fgF6ivQ
X-Gm-Gg: AZFdTZcEBV0cp0AqqutW4H39g0PxKKfH2tu35dsbPM3HxQU2/UO1A9UVgbe7sMH+cHB
	okHBZIAmbzrmUCbMWhCyL+T1kCX/OvlILcgfPHURfOMzLYm52qCGQmv3JZER1YkBC5zsFHWR61x
	i+IPJx81ibdwN/Jugbo15iSeTBLGj5Nui2H/AK5qPguT++uq0rk+1G0hA0i3W3DoxQtCpGXao2J
	1VPWuyBGKmrNZzNrkMzxVkqGmQx0N2aFojf5u6e785qU7mi54Ii9kkl2N3Az8oA6KQ2tJW2z7Rf
	VaIvLl3UkfJvFC3DGvNSWdUesJvJdeS1lBtfj+0i0eVekUxj1/XP9yeEznNF/jMyb0sA/B1HX7+
	hXVjJ1dmYUdDmfZ31zboZIiGkFTb4p3MbhtA/KDDY+wFDn7BTVDbeP90Xac2SG7cH9WvKBqTgsq
	FSzyezWpWjrNAZphif4+I/j+Iu9ZUUquMy9OABmUIc7iUBOvncbZVRlxMTEaOpLZtT12fExbu6P
	zxU7Uu1wIZ27wGH+NwdxS8goVpeFvKQ4Qy2HBQRiKiGeNTOnF3myb1QAT7H2ppI03ePMNZjk2wj
	QSH9vBXZRyGsZqQp7R0E9MHl8DwfuvTNY5uqeHn2eDrJmNogLsho+fjzx1DpXH8blnevrPbIRhN
	vQlPQNC6S2UOlUUg=
X-Received: by 2002:a05:7022:1586:b0:199:e38c:29a0 with SMTP id a92af1059eb24-1b55690e6e8mr13031567c88.31.1795443598397;
        Mon, 23 Nov 2026 06:19:58 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm29427377c88.12.2026.11.23.06.19.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:19:58 -0800 (PST)
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
Subject: [PATCH v5 17/19] mm/swap: advance the global queue cursor directly between priority rings
Date: Mon, 23 Nov 2026 22:19:47 +0800
Message-ID: <7d2e42d489849716d6a4a3b906673959e6d9a28d.1795439990.git.lianux.mm@gmail.com>
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

The allocation walk previously passed a total retry index to the selector.
Each retry translated it back to a priority ring by scanning from the
beginning of swap_queue. Keep the ring index and the number of attempted
peers in the task-local cursor instead.

Snapshot the starting device only on the first visit to each ring and
advance each peer exactly once, including masked entries. Preserve the
large-folio same-ring boundary and the stale reader-offset correction.
The selector's complete walk is linear in the devices and priority groups;
device cluster scanning and availability updates have their own costs.

Keep the topology read lock and CPU migration protection across the walk.
The global selector uses only existing priorities and adds no per-memcg
device-selection state or ABI. Existing swap charging and limits remain
in folio_alloc_swap(), whose failure path classifies allocation errors.

The walk no longer returns an ignored internal error to that caller.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 51 ++++++++++++++++++++++++---------------------------
 1 file changed, 24 insertions(+), 27 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 0c4452fa53ae..5a8663e9f954 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -194,10 +194,10 @@ struct swap_queue_reader {
 };
 
 struct swap_queue_cursor {
-	bool valid;
 	bool no_fallback; /* Do not descend to a lower priority ring. */
 	unsigned int ring_idx;
 	unsigned int offset;
+	unsigned int nr_iter;
 };
 
 static __percpu struct swap_queue_reader *swap_queue_readers;
@@ -307,37 +307,39 @@ static void swap_queue_install_readers(struct swap_queue_reader __percpu *reader
 	swap_queue_reset_readers();
 }
 
-static struct swap_info_struct *swap_queue_get_device(long nr_alloc, int nr_iter,
-						      struct swap_queue_cursor *cursor)
+static struct swap_info_struct *
+swap_queue_get_device(long nr_alloc, struct swap_queue_cursor *cursor)
 {
 	bool rotate = false;
 	struct swap_info_struct *si;
 	struct swap_queue_reader_head *head;
 	struct swap_prio_ring *ring;
-	unsigned int dev_idx, queue_idx;
+	unsigned int dev_idx, queue_idx, nr_iter;
 
-	if (!swap_queue_len)
+	queue_idx = cursor->ring_idx;
+	if (queue_idx >= swap_queue_len)
 		return ERR_PTR(-ENOENT);
 
-	queue_idx = 0;
-	while (nr_iter >= swap_queue[queue_idx]->size) {
-		nr_iter -= swap_queue[queue_idx]->size;
-		if (++queue_idx >= swap_queue_len)
-			return ERR_PTR(cursor->no_fallback ? -E2BIG : -ENOENT);
-	}
-	if (cursor->no_fallback && cursor->ring_idx != queue_idx)
-		return ERR_PTR(-E2BIG);
-
 	ring = swap_queue[queue_idx];
+	if (cursor->nr_iter >= ring->size) {
+		if (cursor->no_fallback)
+			return ERR_PTR(-E2BIG);
+		queue_idx = ++cursor->ring_idx;
+		if (queue_idx >= swap_queue_len)
+			return ERR_PTR(-ENOENT);
+		cursor->nr_iter = 0;
+		ring = swap_queue[queue_idx];
+	}
+
+	/* Consume masked peers too, so every walk remains bounded. */
+	nr_iter = cursor->nr_iter++;
 	local_lock(&swap_queue_readers->lock);
 	head = this_cpu_ptr(&swap_queue_readers->heads[queue_idx]);
 	/*
 	 * Snapshot the starting offset for this walk. Other allocations on
 	 * this CPU can move the shared head between retries.
 	 */
-	if (!cursor->valid || cursor->ring_idx != queue_idx) {
-		cursor->valid = true;
-		cursor->ring_idx = queue_idx;
+	if (!nr_iter) {
 		if (head->rr_counter < nr_alloc)
 			rotate = true;
 		else if (head->offset >= ring->size)
@@ -1845,29 +1847,25 @@ static bool get_swap_device_info(struct swap_info_struct *si)
 	return true;
 }
 
-static int swap_alloc_entry(struct folio *folio)
+static void swap_alloc_entry(struct folio *folio)
 {
 	struct swap_queue_cursor cursor = {};
 	long nr_pages = folio_nr_pages(folio);
 	struct swap_info_struct *si;
-	int nr_iter, ret;
 
 	percpu_down_read(&swapon_rwsem);
 	migrate_disable();
-	for (nr_iter = 0;; nr_iter++) {
-		si = swap_queue_get_device(nr_pages, nr_iter, &cursor);
+	for (;;) {
+		si = swap_queue_get_device(nr_pages, &cursor);
 		if (IS_ERR(si)) {
-			ret = PTR_ERR(si);
-			if (ret == -EBUSY)
+			if (PTR_ERR(si) == -EBUSY)
 				continue;
 			break;
 		}
 		cluster_alloc_swap_entry(si, folio);
 
-		if (folio_test_swapcache(folio)) {
-			ret = 0;
+		if (folio_test_swapcache(folio))
 			break;
-		}
 
 		/*
 		 * For large allocations, try every device at the same priority,
@@ -1882,7 +1880,6 @@ static int swap_alloc_entry(struct folio *folio)
 
 	migrate_enable();
 	percpu_up_read(&swapon_rwsem);
-	return ret;
 }
 
 /*
