Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439121;
	b=xz5MDrs4B9cbOuAziDBPHK7qhjIZ1bzZH4/BlnFWMZHSek5HhL39i6rrchj6xcSwXB+C
	 IPzoOctV3xNKc9kEU72sFSDQIRNBHBvfZukRBMQQ9SdQ+n/5/s1ptQKBqvOxYJ21WVmR3
	 Fxe99TjjZhE6jEiYE33ztyTJcDBbvUJIvi9V5NLUrh3hHlHXzqNAxHfPm4oKoSE9RXAl+
	 Hnrn3gaFz8PTFtA1fYi7BMqf5XjnoAEtRjvo1FIgz3AdcvayLrs4S/ZR/tUpVpXqpX3tg
	 9U+CMIOhwFjCxS/I92eWg/VnBfe5NHxI4GydJhcfPnMYRXNh0lPgJmOzVi8OH08Onew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439121;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=KeSfkpPotB0b3T8E68yPEMk5QMSnlYS1worBwyaplbM=;
	b=tQElR4UaKpJ+YAwVNCTRAkaY4DUp5yd9hVqJXNyAVEZckqg+D2ePLjRDQ6fOMzkjKykP
	 sQgdcLO72Xn89zLFk3KYGKbqN6AcFjSrr77+p0/phrel+YvwGJqABLK/JqsGbU5ItcBfb
	 iy8Y30TrXOVcK4nlTHeu+fQe4hLL4qK9rYyIYnO4nhBqdrFQ36w+s+Qh/EUFmD8fPPMJ/
	 +mmO1XE1cP4Fbf+OV5txv60iHuBMgY6aSCGagurA3tuq9r0RLB/UhZVp7WV9DRzmpFS/3
	 SHz71TqEOBg7ZM0uVX7wiGNez91UFqPFjQ/GSl0MQGcj/oN3cSFu7xSBqfVnkR8sRiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7X4kCMI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC87606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7X4kCMI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091001F000EC;
	Mon, 23 Nov 2026 13:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795439120;
	bh=KeSfkpPotB0b3T8E68yPEMk5QMSnlYS1worBwyaplbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y7X4kCMIFWea4nTmS18Jpy0qF37h3Ec4OkKJXJSHHDBxfkGLCqYFwblSTqzyJqqn0
	 sHd51x7iPAbrfOfwpfzkpB1LDIgqSb5RgkW4eppxKi2dkNVG2/eAfaOUjyyJEjJusd
	 O3TxVMzdsVvetClPO5nkDJ7Xhw7VPt3p9zKzoEmRvG+uxQoqlAfNpcAN7fTGbzLcsf
	 0gp9g13gdE9UxJXxC6LeIul1VQk5adUnnmL1oAiCRGp8Dd7a7M123cf7LVtYhaC76w
	 sPCcbFuE2Hbt2lvOZdUcG5NTxl1VLyequa56esvgffFvKVWIc/QVoJ4497D9HS4Pk5
	 rmZsOhtta9A/A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Chris Down <chris@chrisdown.name>
Cc: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v3 2/2] mm/memfd_luo: keep memfd frozen until finish
Date: Mon, 23 Nov 2026 13:05:08 +0000
Message-ID: <20261123130509.4032642-3-pratyush@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261123130509.4032642-1-pratyush@kernel.org>
References: <20261123130509.4032642-1-pratyush@kernel.org>
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

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

After a memfd is retrieved, it immediately goes back into "normal"
operation. The file comes back unfrozen, and its pages can migrate, it
can be truncated, and so on. If the memfd is depended on by something,
like iommufd, that can open a window for folios to move around before
the consumer can re-establish its references.

Finish is the conceptual point when a retrieved file can start to behave
as "normal". So take an extra reference on the folios and freeze the
memfd on retrieve until finish.

Suggested-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 mm/memfd_luo.c | 91 +++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 72 insertions(+), 19 deletions(-)

diff --git a/mm/memfd_luo.c b/mm/memfd_luo.c
index c963bc3522e6..64635d03d7d6 100644
--- a/mm/memfd_luo.c
+++ b/mm/memfd_luo.c
@@ -55,6 +55,18 @@
  *   Only seals known to this LUO version (see ``MEMFD_LUO_ALL_SEALS``) may
  *   be present; preservation fails with ``-EOPNOTSUPP`` otherwise.
  *
+ * Restrictions
+ * ============
+ *
+ * While a memfd is preserved, and after it is retrieved until the session is
+ * finished, its size can't be changed and holes can't be punched in it.
+ * ``ftruncate()`` and writes past the end of the file fail. ``fallocate()``
+ * fails in all modes.
+ *
+ * Adding ``F_SEAL_WRITE`` also fails with ``-EBUSY`` while the memfd is
+ * preserved. memfd_luo holds an extra reference on the memfd's folios, which
+ * the seal treats as outstanding pins.
+ *
  * Non-Preserved Properties
  * ========================
  *
@@ -457,33 +469,56 @@ static void memfd_luo_discard_folios(const struct memfd_luo_folio_ser *folios_se
 	}
 }
 
+/* Drop the references retrieve() holds on the folios added to the file. */
+static void
+memfd_luo_put_retrieved_folios(const struct memfd_luo_folio_ser *folios_ser,
+			       u64 nr_folios)
+{
+	for (u64 i = 0; i < nr_folios; i++) {
+		const struct memfd_luo_folio_ser *pfolio = &folios_ser[i];
+
+		if (pfolio->pfn)
+			folio_put(pfn_folio(pfolio->pfn));
+	}
+}
+
 static void memfd_luo_finish(struct liveupdate_file_op_args *args)
 {
 	struct memfd_luo_folio_ser *folios_ser;
 	struct memfd_luo_ser *ser;
 
-	/*
-	 * If retrieve was successful, nothing to do. If it failed, retrieve()
-	 * already cleaned up everything it could. So nothing to do there
-	 * either. Only need to clean up when retrieve was not called.
-	 */
-	if (args->retrieve_status)
+	/* If retrieve failed, it already cleaned up everything it could. */
+	if (args->retrieve_status < 0)
 		return;
 
 	ser = phys_to_virt(args->serialized_data);
 	if (!ser)
 		return;
 
-	if (ser->nr_folios) {
-		folios_ser = kho_restore_vmalloc(&ser->folios);
-		if (!folios_ser)
-			goto out;
+	if (args->retrieve_status > 0) {
+		/*
+		 * Retrieve was successful, release the folios and unfreeze the
+		 * file so it can be used normally.
+		 */
+		struct inode *inode = file_inode(args->file);
+
+		folios_ser = args->private_data;
+
+		inode_lock(inode);
+		memfd_luo_put_retrieved_folios(folios_ser, ser->nr_folios);
+		shmem_freeze(inode, false);
+		inode_unlock(inode);
 
-		memfd_luo_discard_folios(folios_ser, ser->nr_folios);
 		vfree(folios_ser);
+	} else if (args->retrieve_status == 0 && ser->nr_folios) {
+		/* Retrieve was not called, discard the preserved folios. */
+		folios_ser = kho_restore_vmalloc(&ser->folios);
+		if (folios_ser) {
+			memfd_luo_discard_folios(folios_ser, ser->nr_folios);
+			vfree(folios_ser);
+		}
 	}
 
-out:
 	kho_restore_free(ser);
 }
 
@@ -553,7 +588,10 @@ static int memfd_luo_retrieve_folios(struct file *file,
 		nr_added_pages += npages;
 		folio_add_lru(folio);
 		folio_unlock(folio);
-		folio_put(folio);
+		/*
+		 * Keep the reference from kho_restore_folio(). It is dropped
+		 * in finish().
+		 */
 	}
 
 	shmem_recalc_inode(inode, nr_added_pages, 0);
@@ -567,9 +605,12 @@ static int memfd_luo_retrieve_folios(struct file *file,
 	folio_put(folio);
 put_folios:
 	/*
-	 * Note: don't free the folios already added to the file. They will be
-	 * freed when the file is freed. Free the ones not added yet here.
+	 * Drop the references held on the folios already added to the file.
+	 * The folios themselves will be freed when the file is freed.
 	 */
+	memfd_luo_put_retrieved_folios(folios_ser, i);
+
+	/* Free the ones not added yet here. */
 	for (long j = i + 1; j < nr_folios; j++) {
 		const struct memfd_luo_folio_ser *pfolio = &folios_ser[j];
 		phys_addr_t phys;
@@ -590,7 +631,7 @@ static int memfd_luo_retrieve_folios(struct file *file,
 
 static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
 {
-	struct memfd_luo_folio_ser *folios_ser;
+	struct memfd_luo_folio_ser *folios_ser = NULL;
 	struct memfd_luo_ser *ser;
 	struct file *file;
 	int err;
@@ -625,6 +666,17 @@ static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
 	vfs_setpos(file, ser->pos, MAX_LFS_FILESIZE);
 	i_size_write(file_inode(file), ser->size);
 
+	/*
+	 * Keep the file frozen until finish(). Other preserved objects might
+	 * depend on it.
+	 *
+	 * The file isn't visible to anyone yet, but take the lock anyway since
+	 * shmem_freeze() requires it.
+	 */
+	inode_lock(file_inode(file));
+	shmem_freeze(file_inode(file), true);
+	inode_unlock(file_inode(file));
+
 	if (ser->nr_folios) {
 		folios_ser = kho_restore_vmalloc(&ser->folios);
 		if (!folios_ser) {
@@ -633,16 +685,17 @@ static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
 		}
 
 		err = memfd_luo_retrieve_folios(file, folios_ser, ser->nr_folios);
-		vfree(folios_ser);
 		if (err)
-			goto put_file;
+			goto free_folios_ser;
 	}
 
 	args->file = file;
-	kho_restore_free(ser);
+	args->private_data = folios_ser;
 
 	return 0;
 
+free_folios_ser:
+	vfree(folios_ser);
 put_file:
 	fput(file);
 free_ser:
-- 
2.56.1.750.gf70dc682cf-goog

