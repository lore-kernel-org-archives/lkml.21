Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106555;
	b=n3bFX5B8H1nct+r1qTzYI9B3jJV7VLYfhR2s8R6F25VUnNQWs0k66fMS0cCYZzyjGMOV
	 ZOrL43wsuk/OYeLa+bIpPM3aSITm7+1RYLJBegSKFHC3aYER8OrYvhjtViPpuyNraVe8T
	 IamwkmkTSxfyyHxagAZU5QJzjRXW8YJDww8F5dMi9xR8U11+f2keaDQ21EdgrCC4rHhR0
	 1CWLKfczlYyoLYT+0vhP/IHPUBDQpo3HuUTXFx7HKdCWKFdqxkWQZP4m3qieX4mk49KZj
	 tD2uTyeTOwJ1zr8M7NeElFhI/V+KeP5czFg3w8w1Xi/TwbVgpURBuySQAthFjMNeyRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BsukE2hzrDyY0pBT/cVWmR7uND2w7AnPFwrDXQRHILM=;
	b=MhH9LCnmEy10Pcg5hicSZBUE8vLx/RuMuLqYAydZk/qss/ZednKwkuOAzmAYP6jPofTc
	 Z6BwwKcigmCB6TJlApfDBsr3Nw0pZVh6oJwTnmD31OHaTksEtMFuSKR0xPrmXiTcDyYBT
	 j4FJLHO+ZAMAedF/WVO6pcwGHGLay8zhkvd1dOd8t3XZWRQqkXk9R1PP6iyurRJtI84eu
	 Ddzgnf1bALWzwJlFMKYfeXb2/0UsZZhMW20MemXhU2dO1ankgpCSJ1tIuz61l4Li4YnGy
	 J/OqpIY7WZ45ZVmFptu/cEPupMlonyS9osCrX3lDz/5wB9GNum5psrb3cRSCepuEP3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l50jD7KP;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1143606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1143606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l50jD7KP
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-702fd86d674so1705866eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106554; x=1795711354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BsukE2hzrDyY0pBT/cVWmR7uND2w7AnPFwrDXQRHILM=;
        b=l50jD7KPGG+8GWjydjBLyFphEI5qU4ykJsvjDouvPNyM/C/8CNZbhb73GK/K8hI80G
         H2/bokBjfm4gqDExbZjQPcTJafS5d+/jWmcSK8r3WK99Y6VtUzGVtIgi0NXU6boibvCx
         t0AKCQryVgKbh+cAx9QOg4xVuj9qg0SfVuNGpz5XXm/knvrmC15Kj85IIenlivd5/y6g
         PiFu2PZUpa8iTY2lWz9Nfpj7jNBsti2PpBRT8ciQGu4lY7ifeMuXzW4HdUD5XQLD9YR5
         6WH1wUCSo5GZZJgrRxNvoi8FCjHPs4Cjnre2q7Jec4vaho+2QjTes/fm+ylT9ij8V4y1
         jqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106554; x=1795711354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BsukE2hzrDyY0pBT/cVWmR7uND2w7AnPFwrDXQRHILM=;
        b=d1paWfZSwgLQthuscG38A1iRStGNxs5tUTrMPbHg1TfTXp2h4s9H4njJT6qsjxMl75
         XP3l1gEgtgOCU+v3x3Z6+TugwLSpmnOwoEuNIvRccNepMu/80sCA7QRrbhukfz/p2q1g
         3piEiTwsYzv7DUTGzNwqIi39pdjxiuAy7canM4Vki9sPeMSkCEjrlPuqYT1yg5w0wFbZ
         tVCo1Q8Ye+r2HwZ/y4N5SmkdPP72ymp5Zu9DpqflgBluwXArqBlewcg8ABi5Nze3Pf/O
         Lu6pdZ6/IlqvDYmgr489b1FMS2j/GDSh1NBwu+LfveRzdVyBtK3Gn94d+xZ82/eyDgzo
         Iw4w==
X-Forwarded-Encrypted: i=1; AL+hErFMUuo0Jeqmifmz5kzozKQtIa3uX69zNLL041s1GyUjIHMXa+bcOo9vkQqcpw87bqPPxPT9e5kvsYTU/eE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WLD8gq1w3GWjvMY9CLmqxFjxs172+iNV2SCeMXZvkgPSKXC+w
	ex78cr4ZWMoK6+GZ1k9i4MNcBf3SJ3Y2BNpu+x1vxynEKly68nHZ57nZ
X-Gm-Gg: AYBFou2H4Ab+vi414H09crC0WqAEzP4YfNqax0w9mfv39MpHo6PObTZFOLvrM8KnvrK
	c7gy4tKI+jkWeKsgqpXs3OJVtFp4P52VTiGSz3PNzVgE4uWxsc/tL/OgoHOqPgHfpHHx4/7MWoQ
	m6JtxLXfhXWFjVXV48gVbVZIzZy4jEsrksXI7XxSDMeMaYFRgfDEtkfXhWWr/QHGJY5gpz0mDs4
	nNq+5Gpcgr0F7H5ct+oNUV0Ccl+gQbGzP8zodeNHZ6IvtuKae7yzrvrqFr0uJw1alE3cvMJorr+
	/14cOLKaNJUvZZoIZ+JtHVexFGx/QL6Mv6vddtIq9nQFOZwiYnA3jMb0oiMIHDUwCqp8JOfn6gs
	1RV4nBfjosmwVp1hc12vJypmZIgdekGzYFSgNlIKANFCmR/NPmQEgqGwLbXd5kZZ4Ua2sWARofZ
	ND9NyyuZT19e3BNpsd8OV+kZ3i/Rx3dBlfwLbYJWYJt0wJ4azNZcs0cIkiQvchXZKCsOr6gPLOq
	G3uhoKheSDXOdCchyWJvpUp9BsrAcLhj3S6M3+jwzJdxaNK+afMdESiefsB+1GMWi5xZCldhVG/
	k6hBHpaX6NSpH+YQJDA0pnP+ueNFZIyo669dhYiC7Y7aC//iNHkYX/L+n0vb85Mv8s0pXf/2vxS
	Nh8DJFNFv/Y5p9XUBs6PknqjSO7cygMd9jVaREWqzn4oncJ4/8d50KhBgycK1xLTqbrADHmn4xM
	TJzvy0aWxyTGQnSZTOeXLxUODCGtOnCZ/eYyop+eRuCfcSyGaB0+g=
X-Received: by 2002:a05:6820:a75c:20b0:71a:fdba:b5c with SMTP id 006d021491bc7-71b395c5a8emr68544eaf.53.1795106553752;
        Thu, 19 Nov 2026 08:42:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:42:03 -0700
Subject: [PATCH v2 05/11] nvmem: reference cell entries independently of
 their provider list
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-5-8fca3ec5f18c@gmail.com>
References: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
In-Reply-To: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Cell handles currently borrow entries from the provider list. Give each
list entry a reference and acquire another during lookup, before releasing
nvmem_mutex. Return that reference when the consumer releases its handle
or handle allocation fails.

This separates cell metadata lifetime from list membership, so a cell can
be unpublished while existing consumers retain its description.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 8c9dfd2e2a63..d9f1bb64a4a5 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -27,6 +27,7 @@
 
 #define FLAG_COMPAT		BIT(0)
 struct nvmem_cell_entry {
+	struct kref		refcnt;
 	const char		*name;
 	int			offset;
 	size_t			raw_len;
@@ -54,6 +55,8 @@ static LIST_HEAD(nvmem_lookup_list);
 
 SRCU_NOTIFIER_HEAD_STATIC(nvmem_notifier);
 
+static void nvmem_cell_entry_put(struct nvmem_cell_entry *cell);
+
 static int nvmem_access_chunk(struct nvmem_device *nvmem,
 			      const struct nvmem_operations *ops,
 			      unsigned int offset, void *val, size_t bytes, bool write)
@@ -542,22 +545,30 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 
 #endif /* CONFIG_NVMEM_SYSFS */
 
-static void nvmem_cell_entry_drop(struct nvmem_cell_entry *cell)
+static void nvmem_cell_entry_release(struct kref *ref)
 {
-	srcu_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
-	scoped_guard(mutex, &nvmem_mutex)
-		list_del(&cell->node);
+	struct nvmem_cell_entry *cell = container_of(ref, struct nvmem_cell_entry, refcnt);
+
 	of_node_put(cell->np);
 	kfree_const(cell->name);
 	kfree(cell);
 }
 
+static void nvmem_cell_entry_put(struct nvmem_cell_entry *cell)
+{
+	kref_put(&cell->refcnt, nvmem_cell_entry_release);
+}
+
 static void nvmem_device_remove_all_cells(const struct nvmem_device *nvmem)
 {
 	struct nvmem_cell_entry *cell, *p;
 
-	list_for_each_entry_safe(cell, p, &nvmem->cells, node)
-		nvmem_cell_entry_drop(cell);
+	list_for_each_entry_safe(cell, p, &nvmem->cells, node) {
+		srcu_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
+		scoped_guard(mutex, &nvmem_mutex)
+			list_del(&cell->node);
+		nvmem_cell_entry_put(cell);
+	}
 }
 
 static void nvmem_release(struct device *dev)
@@ -584,6 +595,7 @@ static int nvmem_cell_entry_add(struct nvmem_cell_entry *cell)
 	scoped_guard(mutex, &nvmem_mutex) {
 		if (!rcu_access_pointer(cell->nvmem->ops))
 			return -ENODEV;
+		kref_init(&cell->refcnt);
 		list_add_tail(&cell->node, &cell->nvmem->cells);
 	}
 	srcu_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_ADD, cell);
@@ -751,6 +763,7 @@ nvmem_find_cell_entry_by_name(struct nvmem_device *nvmem, const char *cell_id)
 	list_for_each_entry(iter, &nvmem->cells, node) {
 		if (strcmp(cell_id, iter->name) == 0) {
 			cell = iter;
+			kref_get(&cell->refcnt);
 			break;
 		}
 	}
@@ -1397,8 +1410,10 @@ nvmem_cell_get_from_lookup(struct device *dev, const char *con_id)
 				cell = ERR_PTR(-ENOENT);
 			} else {
 				cell = nvmem_create_cell(cell_entry, con_id, 0);
-				if (IS_ERR(cell))
+				if (IS_ERR(cell)) {
+					nvmem_cell_entry_put(cell_entry);
 					nvmem_device_put(nvmem);
+				}
 			}
 			break;
 		}
@@ -1422,8 +1437,10 @@ nvmem_find_cell_entry_by_node(struct nvmem_device *nvmem, struct device_node *np
 	guard(mutex)(&nvmem_mutex);
 
 	list_for_each_entry(cell, &nvmem->cells, node) {
-		if (np == cell->np)
+		if (np == cell->np) {
+			kref_get(&cell->refcnt);
 			return cell;
+		}
 	}
 
 	return NULL;
@@ -1522,6 +1539,7 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np, const char *id)
 	cell = nvmem_create_cell(cell_entry, id, cell_index);
 	if (IS_ERR(cell)) {
 		nvmem_layout_module_put(nvmem);
+		nvmem_cell_entry_put(cell_entry);
 		nvmem_device_put(nvmem);
 	}
 
@@ -1635,6 +1653,7 @@ void nvmem_cell_put(struct nvmem_cell *cell)
 	if (cell->id)
 		kfree_const(cell->id);
 
+	nvmem_cell_entry_put(cell->entry);
 	kfree(cell);
 	nvmem_layout_module_put(nvmem);
 	nvmem_device_put(nvmem);

-- 
2.53.0

