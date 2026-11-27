Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795797174;
	b=ygIsHZtY4u9mx83Kx3h1ew4v2axuUtr8gcr8B21kGctpqoZr9BoBllmzQH5MM5zcCDAM
	 +l/CUUC2JfuBC44kjqbIKAFkWB30DklFaV6yrI+BD9Tn77HFl9rICnWTLkQ2Y6CldEvxD
	 qYQcD6vxlDvv2LrUN6UCaOTcbH3lhB1U2BWHx4ykHeuyNtMiVMhHyqJX+o6rFZuL8hINM
	 TQfsnjk5IsqbAmZtWLnFgI03IE9Xc+1z4dS78dzvJWdyuby9xeCXV13BrExkgyNjAzemh
	 001Z7SPc5fclDZYX+ZswTmQsqNBrog3j9aWAEn+teCcTPFsbqDTbRrV1ReSu/874l0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Mailer:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=BzVKtW5NHdb/sxlNHYFUIiHG+65dbsYhejickBFJVMk=;
	b=CqBmE/RCXBlgNe9+3sJn9OQs+W5KgIFYBIXIodZ3oYiyUZ4J+l41hm4qKjXT1S/D16EZ
	 2C6Y0Ki9hb3Xir2DV7LbvqvSSAMBeVR6WcvQQ6IETRwBbSuVsUG3QR7/AWoRbI1lMJi8A
	 UEDolJyMKMqdxG7iX2SfSMt5dw9QhXE5ymNQxH+mn97PjDpISXedQzDMESvFJseAUobrq
	 9yl/UEtOXNZDeR70PadFeoBdnWm1epAAyOTxLHj5KDx4m6ptEKhJtEp0rGJnNEIkxv7n3
	 +m89CBdHU4/IIFAtKIMuWpNs9H88H8bt3zOzhIvRB8GvGyQf/jbyCFrOBt9G6mos/3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=echophase.com;
	spf=pass smtp.mailfrom=echophase.com;
	dkim=pass header.d=echophase.com header.i=@echophase.com header.a=rsa-sha256 header.s=google header.b=nU7VRCMg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DF0606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9DF0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=echophase.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=echophase.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=echophase.com header.i=@echophase.com header.a=rsa-sha256 header.s=google header.b=nU7VRCMg
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-679a2b5fe87so7629434d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:32:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795797173; cv=none;
        d=google.com; s=arc-20260327;
        b=pK9zBDljoGSunqO1wLPzKEQHIPfalYlXHjpjiTnKgXtlenQqSQWap/HrHHJyziMPES
         xsMWRE9vpUfPMzuwu3XVYutZu6TQ+7PgbaOYe4/h5ZD8OG6xp4S1PSjMXRGBdi06U5vy
         LFMWnoSN3xygrUrs/azHv/CDoCxH7FdtfRfDcCtBnUqg3tCdeqsgEEC6hgxderzdm9h/
         VpSyO8pNE3pf4z+WzoOJpNtJ2QFonVGtj2WtqPj9eHklna09rIgWTG+QReQVOSzNcNT5
         9iN7qkI921Uci/MfDCwa4N2sz6xTr6WMQOtGNHP0VsiUlkqUrgLTUNVTzP/f0JjUDZYV
         RO/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=BzVKtW5NHdb/sxlNHYFUIiHG+65dbsYhejickBFJVMk=;
        fh=WHu5Ul/4l9YzXWNpk0NTw5VRSJnJOVerg6zKJ35r0Yg=;
        b=WIj0+74kfvcrWc+QkWdA3nbOHWHhEKbWIohH/bae/aJ0o71HezAbchkhS2Crw99dwF
         iJRlr8MyfjT8A+svOt5vJwxrqERDlUkboh+vh4P7lZojEN9bMQou+4MbRSmQYU2pIS7a
         KZlC1yoffpYGNUWtScMYgfQEv+nUEZVsTP0QVl+iRHmuIBghW4kAim5SrgNPLcU/zlQA
         4mX0k/Q8vPWK4Cf5/yfD1si7t+7hYIMsGeDjCaZszRjzAi/e0Dccf+jXpOkoSBGeSY9m
         UDUTPAU8aPkx5R1dkcX9FF7ow+HFF4+PfAFRcgE+oW89WTYXejS4FSGoEG/V+BbgfM1m
         doJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=echophase.com; s=google; t=1795797173; x=1796401973; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BzVKtW5NHdb/sxlNHYFUIiHG+65dbsYhejickBFJVMk=;
        b=nU7VRCMg6S/PeSbcDbddxdWo5UV71g1l2fPnpOLkBeJHmI9vd/VtSayPDD4kRpRLyL
         n30mU1diRB602R5GjrBWEK11PMzWVwFPDFMdbfX3zOVnhtYiJhipK271461Ahnt7Yu2j
         EBBIpeZK7iLzsCFsZHOZlYSjWk0KxQurIsoodiKn0DPM9Rb4dMKDzmAZgiyzStC8x9Jl
         Pjn8YwTY8PxnTUoiD6d0Mr8jKHAg+Ht5fddR715CorMfa7728u5pwAqNMOIF6baQVaSl
         2tzK1TW/qAVbfSOPjzZlRV6Cf66oqXNcO0DyT1D9Y1IsW77fm9WP6bqRC+Nc6zBybrXO
         p7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797173; x=1796401973;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BzVKtW5NHdb/sxlNHYFUIiHG+65dbsYhejickBFJVMk=;
        b=RIuPRqoFS02yO45D6Zn3tmOjGD9yPUHW7o2/ztf6RfQHujWW5gduWpcQtM/Pj2/V1c
         rUdW3uD9KN4IuvGpMjTMoCgnMskSnlFmYBcpJTbPzhnAy2lxIVCJdEn04Knu6AfBaG8N
         GhQn1kLfAoOEU0XmxJxJVR+HDMoMA/C/zePjkbf0oKgKyVSaRWexojNxRB21J7BA2dbK
         Cm+YFpCHvANcOukY78/nxSukLnF8l5flyrJn8vCoEuf1wq1yR7wzpAb480Ie0GdsJvyU
         Vc8R/f3Q8KbJo7CzCVMRfpV+J5qI0LlmWEDfQejy+OrNlVLeUWbD2MG2o2Wj3nPYX1/i
         +ZSA==
X-Forwarded-Encrypted: i=1; AL+hErHrFSrQCtQjNsM6uUaNgEUe+/f/PUz9W5pZKwekmUeflKeThLbhuDhD8a6r5cY9b3ntHAumqQDUGMIFdDM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WlrENcTamhGyp4oNdJAFJnKYLCW9+O25V0enH7s51nCyyswU1
	Sd/omEvA614zgNH8OZzMhPcMdtvtkkGUlP4EgHMXh4/6eVPKK+jufjxkm68aMaymFaaCrk/G2ui
	smD2jWtXAWVdpPJ5AwvuPQQG44vCLlB9X1f6aJv9DfA==
X-Gm-Gg: AZFdTZe7xIy0kXVunL4Bqx98Pem8IWXixS6QCJDXiz+GK4yxceqwrjpmscMR7njtIgO
	nEv7T9IqKl0sev9cu/aLJajcamvvF0ANWrJyQOtm3hDAgooY1o5jXWlQFtGNsSB0IwpLeZ2DwCC
	e56cULjqd9k1nHhZ9vSxgi7c1+ZYCEzmnRI33ud+1h0WAmRNb9YhdlYjtAQZ42AuafGmSJhbPiM
	m7U2SZqnYgMj3OhD/UyOpjttLBdn5J48+tfwI6zGZqIeKit/Xj5d3XRlUE64giiIL5350nOCK8R
	DefZ6po1ZqoD5wHe2HYCQNT/22dCOQak9vu/aokdYFidf6lBFziWATuq5RuU2TZlZRlqcYG8cXt
	Z7yh1lBeWpPoCYht+7meieBxwHUGvJ13atTl7aS80UzWOrGiYMTXOozO1am5pbqn5w5R0ow==
X-Received: by 2002:a05:690e:47c7:20b0:679:ad63:6752 with SMTP id
 956f58d0204a3-67df4485df0mr6760668d50.88.1795797172525; Fri, 27 Nov 2026
 08:32:52 -0800 (PST)
Received: from 1009040482268 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Nov 2026 08:32:51 -0800
From: Ramon Nogueira <ramon@echophase.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 27 Nov 2026 08:32:51 -0800
X-Gm-Features: Aa3M54rMQUzpO4yRAeN4raM6katXNjxW27MCpyzDDVBLsa2OU0HqYrWxnLZTdwk
Message-ID: <CAMM96J2Ma3gSwZAtF2S2XNWxP4wBtN5VxYRY_KQO3fqNGztrEA@mail.gmail.com>
Subject: [PATCH] fs/dax: do not replace existing shared DAX entry on read faults
To: Dan Williams <djbw@kernel.org>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Shiyang Ruan <ruansy.fnst@fujitsu.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ramon Nogueira <ramon@echophase.com>
Content-Type: text/plain; charset="UTF-8"

Commit c6f0b395b211 ("fsdax,xfs: set the shared flag when file extent is
shared") replaced the write-only cow check in dax_insert_entry() with
shared = iter->iomap.flags & IOMAP_F_SHARED so that
dax_associate_entry() receives shared=true on read faults of shared
extents as well as CoW write faults.

However, unmap_mapping_pages() and XArray entry replacement were also
switched from cow to shared. As a result, whenever a filesystem sets
IOMAP_F_SHARED on DAX read faults (such as XFS on reflinked extents via
xfs_read_iomap_begin()), every read fault on an already-populated entry
zaps all mappings of this file for that range and replaces the XArray
entry with an identical one.

Two processes (or distinct VMAs) reading the same page of a reflinked
DAX file then ping-pong: each read fault unmaps the other VMA's PTE,
causing repeated page faults, XArray entry lock contention, and TLB
shootdowns. Furthermore, a PTE read fault hitting an existing shared PMD
entry unmaps and overwrites the PMD entry with a PTE-flagged entry.

Keep shared for dax_associate_entry(), and restore cow = write && shared
to gate unmap_mapping_pages(), entry replacement of existing real
entries, and PAGECACHE_TAG_TOWRITE. First read faults on empty or zero
entries still enter the insertion branch and pass shared=true to
dax_associate_entry(), while subsequent read faults leave the existing
PTE or PMD entry and other mappings intact.

Fixes: c6f0b395b211 ("fsdax,xfs: set the shared flag when file extent
is shared")
Cc: stable@vger.kernel.org # v6.2+
Signed-off-by: Ramon Nogueira <ramon@echophase.com>
---
 fs/dax.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 9d161d7ef..de3931788 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -1078,11 +1078,12 @@ static void *dax_insert_entry(struct xa_state
*xas, struct vm_fault *vmf,
 	bool write = iter->flags & IOMAP_WRITE;
 	bool dirty = write && !dax_fault_is_synchronous(iter, vmf->vma);
 	bool shared = iter->iomap.flags & IOMAP_F_SHARED;
+	bool cow = write && shared;

 	if (dirty)
 		__mark_inode_dirty(mapping->host, I_DIRTY_PAGES);

-	if (shared || (dax_is_zero_entry(entry) && !(flags & DAX_ZERO_PAGE))) {
+	if (cow || (dax_is_zero_entry(entry) && !(flags & DAX_ZERO_PAGE))) {
 		unsigned long index = xas->xa_index;
 		/* we are replacing a zero page with block mapping */
 		if (dax_is_pmd_entry(entry))
@@ -1094,7 +1095,7 @@ static void *dax_insert_entry(struct xa_state
*xas, struct vm_fault *vmf,

 	xas_reset(xas);
 	xas_lock_irq(xas);
-	if (shared || dax_is_zero_entry(entry) || dax_is_empty_entry(entry)) {
+	if (cow || dax_is_zero_entry(entry) || dax_is_empty_entry(entry)) {
 		void *old;

 		dax_disassociate_entry(entry, mapping, false);
@@ -1102,12 +1103,13 @@ static void *dax_insert_entry(struct xa_state
*xas, struct vm_fault *vmf,
 					vmf->address, shared);

 		/*
-		 * Only swap our new entry into the page cache if the current
-		 * entry is a zero page or an empty entry.  If a normal PTE or
-		 * PMD entry is already in the cache, we leave it alone.  This
-		 * means that if we are trying to insert a PTE and the
-		 * existing entry is a PMD, we will just leave the PMD in the
-		 * tree and dirty it if necessary.
+		 * Only swap our new entry into the page cache on a CoW write
+		 * fault, or if the current entry is a zero page or an empty
+		 * entry.  If a normal PTE or PMD entry is already in the cache
+		 * on a read fault, we leave it alone.  This means that if we
+		 * are trying to insert a PTE and the existing entry is a PMD,
+		 * we will just leave the PMD in the tree and dirty it if
+		 * necessary.
 		 */
 		old = dax_lock_entry(xas, new_entry);
 		WARN_ON_ONCE(old != xa_mk_value(xa_to_value(entry) |
@@ -1120,7 +1122,7 @@ static void *dax_insert_entry(struct xa_state
*xas, struct vm_fault *vmf,
 	if (dirty)
 		xas_set_mark(xas, PAGECACHE_TAG_DIRTY);

-	if (write && shared)
+	if (cow)
 		xas_set_mark(xas, PAGECACHE_TAG_TOWRITE);

 	xas_unlock_irq(xas);

base-commit: 9437ee8b6cf607e883b36e44bd755968daaebd48
-- 
2.54.0 (Apple Git-157)
