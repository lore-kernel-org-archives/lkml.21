Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205324;
	b=qm2+xdgKnnVn6rC8P8mRAEb/XvwoI6369eZi9CRbMH+MijEvVgzG/zyFqoMLZyOt92m+
	 bsy/oJWoRuFnywcFZPXdfsBiSVSTOWPf+WYBYi3WczW1OdqXP+UlGpBBG+/LvcjTiD1Ym
	 J7aOAK28ar52CNeIxFcm94WWYv7H2DHzDLK79SNgp2K8SL21UePoTmkgpaEf/ag2NiFkE
	 DLXZqjRDS6LZuSg0Y5FTC3C/y5vOjOJhjSKjFXAUdpv58gDRgnf8+DIXtnjO0I6E20l9W
	 DXYqyF7JqsgztXQE+M5FCnyL7XCcsW1VGF2Kgl6hTBlTU0NAkYKImmGhw6LQgFx76gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BsukE2hzrDyY0pBT/cVWmR7uND2w7AnPFwrDXQRHILM=;
	b=veu1/NHn4UPvBvwnx/xiLDt8xzNPDf4AtlL2/3eg8AQHL/sE/BtJlpoq9M5DuhxPdpAr
	 GmJT7jc4AW4YmT8KlMSmZpY+5qEzV9amUUCuTHa6HRGaUu6Q95pOq/XJJ7hDDGVO6DzfI
	 /Qp7xhkakWqBMOYKhS/oTa37oW/aWO+h5WN6e6XGr9+G3y66mj7uXEDGgfhthFRgXAMeg
	 XVvYDFt7bjRTc1UBYs+je5+qU16GO39R+rKwr5IvDvP1jQcpEpMCLTfeSrEwPkZZam2Ur
	 28/VMxthj7SQ1HgPHTt2jXSFHINTrvTGpR7j9dNNWqWt3soAOrvdsdHfc+9e+v6i1Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qRyqfbXV;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8165E60A260F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8165E60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qRyqfbXV
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-833e671ee9fso1268822a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205322; x=1795810122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BsukE2hzrDyY0pBT/cVWmR7uND2w7AnPFwrDXQRHILM=;
        b=qRyqfbXVOi87KAby7bGopLqDAK47lGcb0Bos4A8KumtUXEFy+/9S5CRMwmG8ikaD3a
         S5Dyj2ZgMPOXdJgp+22ToGjE3d1wBy8PTavNbyKb65UWXwLxici86HhZYCuGk8j2ThD7
         uQH6AjhemBvstLTQFjJxvVN0kC8fzpX/lXEj1/dgmlJCuSmhiXv/jyjce6M1ZU+CKcrl
         0AdlzUwRqa/Avcw8AWOnKY0U5fs61mncUeUxuHMaXu0gjHKV0S4UMHNlZA2+ZrzWhEYO
         1SQ/qLg02/Y8M4GdNG0Bq2LCAvcnYvP1u1J67sUOqU1VBURTd1LxzZNt1OgO/8kf2qUj
         Ozqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205322; x=1795810122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BsukE2hzrDyY0pBT/cVWmR7uND2w7AnPFwrDXQRHILM=;
        b=xYC1ybuyLPimerP0B9V1CKKD5cn0UsIlLYlmx/Sof2PcP89CKEIq5AuSEmW3jWJ8P8
         uZZI5ml/lt70cS+hV64R3+F9DFHlETDwzdAJoYBB6eVBzxFyOv9XQDiEng6ijZZwRQw9
         wfMftqq4r/rF21DEwD1ouk0drdaaGBkWrlkmT1cUOIUe1VJwy23NI6hkrs7Bjrn4fTg6
         cdgjEdmJjN0crdbicTG7YsX7ftE/9hZnQWKSOi9slAOX0JOQnJ3YmMZADOD5CgwloMXL
         ZvGkkfvnmr5KLh6adfYbu1ctlaPZGPPDYoOqYM0vwodSFmaIgvOf78W01WTswosRELuQ
         TJ4g==
X-Forwarded-Encrypted: i=1; AL+hErFZ/Rz2/rk9n+dzhDOOxkI1tvq1CJ2ZOA8KIAzMe+lNq++ILtfY/z/xMI+EBT6RidSjIVb9YYNe3L67b+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FiJdCsyhk8pBJrcqmp3Q9rb9GXfRwv0FVjC3Dd65BufXU6McH
	02ucH9+fCu7LknJFVbQWIaaKbzpIJED8xxPCydsymQuykdMk6/ty52l6
X-Gm-Gg: AYBFou3Spz+ahl5ybNxtGaOYV4ty0BJ+uQLHqV09aDzMpg1yrctFsGYi4CEYMc7vxcS
	KBolSG7GlUEdiCrA4mh575fv9kkMTF5s3Qid65iKWDSvMBxyz3qFJNTBTPWHdJ+1TwBJC4ul2IO
	Hp/cy86ooSxgQ4tOh+k0Ce58IC/6Qs0u/ok85dPqK464dtxNOUQRt9zCSAxuOmSrPobkkWD5wtC
	cFxkoHj4QdBG+tjNQJvIzseF4+jUrdjTYa8oki58KabxF99JfjCIXLFEqfdTEUgVGnJb8tXcaTK
	6A4GjVEqkaz2Hs1+hyp7FoFdRe6cnTUNgEV2RQD/ro+hrnxv4sYPIr8X4pJ25t2MC/dQ5Xt1MJf
	I/2KKSWOWedwLuqOeGI9+xtc6UwuoizZ5TIALod+zCYs/YzQwwUe0wrQP4uE+BNEXFt1KF08r2W
	YVJxUQ3Zb3y81yy6LIziF25TVd4dr2zKMvNv5rvkRCAvYiqCqGFMQr/FXCCkUVJohIWASq/nK/w
	jW0R8QBnracoCWlPfUwGI5C/mjvT9JcRUehY9HResVEEjp60PLgBB9KW21dT8GtBIB97FwuuZ/n
	P2BwUE/YpaPB70H5hkv3URzRqSchBdRd4IiaTE1DYNheuReJuixpfDBg6QreJwSfjN2KyV/fKy3
	KDw7Gg9Gc/NM45ccsOzLO2CHZJFtX/tqUkpyNo+yTHCeUl7iyjKk6vsGCmXc216GDRxE/Gc7GPt
	EvVrv7vnaxgAjkBcnW+gE3/vk2mtd2fYhP9H8vog==
X-Received: by 2002:a05:6830:680c:b0:823:e626:2764 with SMTP id 46e09a7af769-863156221c3mr5320264a34.5.1795205322490;
        Fri, 20 Nov 2026 12:08:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:35 -0700
Subject: [PATCH v3 05/11] nvmem: reference cell entries independently of
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
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-5-523610652402@gmail.com>
References: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
In-Reply-To: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
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

