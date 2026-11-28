Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886825;
	b=GNxVIzUi8uvUg6qakpBaIcF9edC3fw55NCYk9AUrvojp26q2+8ZWHiBJebBG271m30qj
	 TqTlzNBao1uUckYW+0QL9U6ZmzDRju7O+OXHF2qWhrb0uMPOQArtwyKXjl2gPhrmn9xQY
	 /1U6JeD0Pz7orl4Ju28+O57Kfiet/5Pc5y7SWeiBPHZSkc5SquTDkTA4ipyHG5xLPE3pb
	 IFOuGDTGhDofsCOjACenr6eU8dnnrib1SGDsAJmOmNd1nYF0kf58KO7rD2irr3vsJG+1z
	 7+dPun1Bjxx7xweHuTZm1B0XPF5JPujYxdrtOIz6XgfoWFNZnF5eYEA7I3MktMqUPxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886825;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tGnTiWlCRmiSff2N/n/FoqfL2LYbJESkUupzqrlMD2c=;
	b=gQGtnPhlukU8wSHUF9Qxdle5tPXMi2VCbWN1/uKteLO9rGX1AelgRvafPDFcpB+g1Kvt
	 0y7lf1tw3ZkLbNOrzh3GjTe9htPo03N+EOaGAs4L6gZMqvSc18RSiWboTvUjnn3rA0yQU
	 pVS+HhjkWl8cfvLhdBHQiZkxipmmOtWszuGxuwoTOXsgWqqZx7EZ9u5Y7dITPtxVkgCEz
	 5zHPBikvAv6qSur7OS0jSLXjy8KdUAg7womys3P3SzXUIuGCwo+6j3pWlcwfu2zNpf3gs
	 j/Tl8VlX5n+FWzgeWOAo6Cg33zXRDnHaRvhz2TmUR4yHlVBdm3g38MnHmwxmcdp3f0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N4wmFDZ3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC023606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N4wmFDZ3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795886824;
	b=g10uk5juW/a1mXaSRNkNeo563LBmv27tcLCvMxfKbOggUS+GSEYdlvZqhopYCIoJkjw+
	 rsXD/PNEdzYiiIzHcOP5CXtaGJAPqvkZLMTDQQwmDDbXzDrBT9XTurNc40DkxLyWRzjF5
	 5WhUILMyxtUUY4bSpoMar/giYu5iod1pCPOL/Fp3/40BDIpcV4LxpZrxPFoQX8N9uObVD
	 EOtFKH5i60y9oxg7cQenTdAPsV7zCOphup0VUE9Nw/N98Bb/JcPtMatQdSGpUsOeLFsRl
	 7/u8tEpjgUzqvqnvF/NyK92qK2on7Eq2/vVND10SqCy0sF8xUS9FYZL49XQC0syvTuQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795886824;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tGnTiWlCRmiSff2N/n/FoqfL2LYbJESkUupzqrlMD2c=;
	b=JRfULMTQzRAPF1RwzxW5EUBlwoEWrkDQ74lPk+uccsEnqjMJj8DvlghdrZfwP/oGTET1
	 YnwcUL1t7L445xIEoBfr9CuHSiVQDdwB/DSVwF6w6sBarO/xPoDC7mv2aIbxQJXGnFRhz
	 SJjLBt3trlIi2HRF0dN/MxNeGD0FmeC4xuw2KrPkTDxQigt18P38rAdiVoOaD6iSrPUQx
	 UO74x5HY62Rl6oCZbIyQfh/j0V43G6iBXjauQB4nPN+jfiTd0oa7GReujmvFJtdNKKyHw
	 R6/h3jWiXz+xXmbtS6V2YM/fZd1QvKFJBYQO8XkotsLEhAGKSxIEtG5rbsSd7iqP1Eg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56A251F00932;
	Sat, 28 Nov 2026 17:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795886824;
	bh=tGnTiWlCRmiSff2N/n/FoqfL2LYbJESkUupzqrlMD2c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=N4wmFDZ3AdFwMjAXrPlk64xtYFjnqdeqtSmRjxb0OzOpmYIAumnnpvICW5DqKxD8r
	 MiENAtahYUZX8VtiQqeQYnqCH5Dq7vJQbpBUErw4vUP6TRZC28QZ9XWGx+fT7F9X5w
	 3WaQrWJVNeReQBeS/+d9fi9/Xx6TrEP3OEDV0bj2WxPHqG89pqMB5NR/ei6VyVikcu
	 7i8GvBCp8s4yZzfvcpfd2RDrgiWLGpY0ERPoozkJhEp0/YlHaTu60fJZ903KETw+bh
	 cO7rmn2YY9ue3kEpP//i1Qrs+9v6gtDA0Qac6htyREMDB2A53XhLzHAdhRqEgtJUM9
	 fhCNRY5epFh+w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 249CF4E1A7;
	Sat, 28 Nov 2026 17:26:35 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:26:48 +0000
Subject: [PATCH v5 17/17] drm/panfrost: Name the BOs around an unhandled
 page fault
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
Message-Id: <20261128-panfrost-long-jobs-v5-17-e7d62045a676@gmail.com>
References: <20261128-panfrost-long-jobs-v5-0-e7d62045a676@gmail.com>
In-Reply-To: <20261128-panfrost-long-jobs-v5-0-e7d62045a676@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795886791; l=3787;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=5eVur+mtkqF3KeuduvBSAt8Mmx9XxQ3xEdEtH3eF7lE=;
 b=KQH4yFG9/G7pUH6NQewUiL4/ukv3sbLAjAYZ4UXZ9qzuxCZzGxPiIA31ylMexXN9Wwuc1Pc5c
 2Po3Un3kFq2BALkPAISic/I4dBaw9Lexux8d0DLYoMB73op+I3NBBrw
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

An unhandled GPU page fault reports only the VA, which does not tell
an overrun of a BO from a stale or garbage pointer. Also print the BO
that contains the address, or else its nearest neighbours: VA range,
size, distance, heap/noexec and the userspace label. For an OpenCL
image read on a Mali-G31 it showed the texture unit reading past the
end of a 96-bit-per-texel texture. Heap growth faults are not
affected.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 76 +++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 92a4d2963..0f81fee10 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -590,6 +590,81 @@ addr_to_mapping(struct panfrost_device *pfdev, int as, u64 addr)
 	return mapping;
 }
 
+static void panfrost_mmu_print_fault_bo(struct panfrost_device *pfdev,
+					struct panfrost_gem_mapping *m,
+					u64 addr, const char *where)
+{
+	struct panfrost_gem_object *bo = m->obj;
+	u64 start = m->mmnode.start << PAGE_SHIFT;
+	u64 end = (m->mmnode.start + m->mmnode.size) << PAGE_SHIFT;
+	u64 dist = addr < start ? start - addr : addr >= end ? addr - end : addr - start;
+
+	mutex_lock(&bo->label.lock);
+	dev_err(pfdev->base.dev,
+		"fault bo: %s: VA [0x%llx-0x%llx) size 0x%zx, fault at %s0x%llx%s%s, label \"%s\"\n",
+		where, start, end, bo->base.base.size,
+		addr < start ? "-" : addr >= end ? "end+" : "start+", dist,
+		bo->is_heap ? ", heap" : "", bo->noexec ? ", noexec" : "",
+		bo->label.str ? bo->label.str : "");
+	mutex_unlock(&bo->label.lock);
+}
+
+static void panfrost_mmu_report_fault_bos(struct panfrost_device *pfdev,
+					  int as, u64 addr)
+{
+	struct panfrost_gem_mapping *below = NULL, *above = NULL;
+	u64 offset = addr >> PAGE_SHIFT;
+	struct drm_mm_node *node;
+	struct panfrost_mmu *mmu;
+	bool inside = false;
+
+	spin_lock(&pfdev->as_lock);
+	list_for_each_entry(mmu, &pfdev->as_lru_list, list) {
+		if (as == mmu->as)
+			goto found_mmu;
+	}
+	spin_unlock(&pfdev->as_lock);
+	dev_err(pfdev->base.dev, "fault bo: no context holds AS%d\n", as);
+	return;
+
+found_mmu:
+	spin_lock(&mmu->mm_lock);
+	drm_mm_for_each_node(node, &mmu->mm) {
+		struct panfrost_gem_mapping *m = drm_mm_node_to_panfrost_mapping(node);
+
+		if (!kref_read(&m->refcount))
+			continue;
+		if (node->start > offset) {
+			above = m;
+			break;
+		}
+		below = m;
+	}
+	if (below) {
+		inside = offset < below->mmnode.start + below->mmnode.size;
+		if (inside)
+			above = NULL;
+		if (!kref_get_unless_zero(&below->refcount))
+			below = NULL;
+	}
+	if (above && !kref_get_unless_zero(&above->refcount))
+		above = NULL;
+	spin_unlock(&mmu->mm_lock);
+	spin_unlock(&pfdev->as_lock);
+
+	if (!below && !above)
+		dev_err(pfdev->base.dev, "fault bo: AS%d has no BO\n", as);
+	if (below) {
+		panfrost_mmu_print_fault_bo(pfdev, below, addr,
+					    inside ? "inside" : "below");
+		panfrost_gem_mapping_put(below);
+	}
+	if (above) {
+		panfrost_mmu_print_fault_bo(pfdev, above, addr, "above");
+		panfrost_gem_mapping_put(above);
+	}
+}
+
 #define NUM_FAULT_PAGES (SZ_2M / PAGE_SIZE)
 
 /* [start, end) is whole folios: it can reach past the 2 MB chunk. */
@@ -964,6 +1039,7 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
 				exception_type, panfrost_exception_name(exception_type),
 				access_type, access_type_name(pfdev, fault_status),
 				source_id);
+			panfrost_mmu_report_fault_bos(pfdev, as, addr);
 
 			spin_lock(&pfdev->as_lock);
 			/* Ignore MMU interrupts on this AS until it's been

-- 
2.55.0


