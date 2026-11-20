Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207913;
	b=b2g7PTOSjAgYWY6cXscUk4ZTa+xfR92kfFj9A3FfpqeVCN3Ol+5WI4gM5mbwtSN9IibM
	 6mHwLdTIjLEF/rSHdwMfoSdiLHMfA1LQ9Tn1FWR3ZB8aoyCQ9CoJ76aQHYdUL5yb/CbeQ
	 b5lOZxOmkhK8nOo5RVqYSXdLPQVCSPjppa0ryJkuypHN3Gkh9hnx2cfi/JkK4UniSD39r
	 Q4ozpFLf08mtiKBy7Cigm7tDxFLhx7ctOT6OmO3GkUkKc/2he9mnakRiG4snjrxjv26OV
	 6NnnRSyTOwMmdXzPU6o0jpXzyejwnSnCGwJB0GgHzC2KaG3E8WCzF8kjG701XE0XwTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=bmDo8lYrQ46wjdEUEvmF2H1dGPZ2XCHvbWiiAWZjHPk=;
	b=Z34b21MENvW/dGEHc7ZvgqmycDUJQMqhEwK3jLmiWboIMRm/jWHDu8Mt3n9NKVb+dhq+
	 4kX1GCVx9rKDyg5Qb4aLGpqJCDrnmzVK/ixfWxP3DvRNCtO9CtKif4lG+Aolq+umh/X8u
	 taM3slQexkTcwsCnKrRF+pKQWFGGOvNfxwkrBmR/WMm+8OJ180IV3v3Z7mtOrluXduSBu
	 GxeI7cKUsRodv/cgWulEzvvwBXTdW1C5Dvi1oiLvCVdnjT4IJjIc/jRuUc1TI6P4Z8yTV
	 YPl9uC1KFf94EBri+Lw1bjyJQDxlbV8Ipj3aUgC+WnyW2VmWlv3OFxGlJhX6Tt80QwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=POHpYIdc;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D74A606A689
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D74A606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=POHpYIdc
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-94961d90b79so164870585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1795207906; x=1795812706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bmDo8lYrQ46wjdEUEvmF2H1dGPZ2XCHvbWiiAWZjHPk=;
        b=POHpYIdcSc9DudTRYsVphM9SmFJ2AhWB+OGRTCgbyZK3KOOAYRSoWV8Bre4w8j23J4
         YNlRw/DY1CNbk7SYeQOXt/WH0sifG7W+nMVYiEmzOmxfY306OF2lX0qajVz5AmUDMEyI
         BDtKCPMdzZ+QMalHwV248Wjs6LlZ6oi9i/Lvatw+hw27aCKlwMLR47aQIMR+Mrax0oUy
         tNxbc+ldsG9zGAwxKGQeVEUfl30sawtpuFGMsVA6HqVWb3VSAtKxIDUowTW7n8d4epG1
         Bg1KnuQWFqqAUXPLKEnDN22DRj3qvSQZfb9hFv9FUH+aJKIRDJOTpzyHUr4/+ak67n17
         QmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207906; x=1795812706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmDo8lYrQ46wjdEUEvmF2H1dGPZ2XCHvbWiiAWZjHPk=;
        b=WlRhdN2mkvptneMnct4bseoiSJh1LcT5bfvhl6mVd5vMNA2W+68dkLAax2Ht/BJByB
         sOGmpYlwgGYeyD0ZvzdZof8XZk7dssWGLWl8U3IlIzmGSRrvSxdeLDw8pCogr7RmRVhG
         qPDZv6swBB7THEm1/FPhbf+cnpcbx8HXySYxOg0s9x2qKwA6XJQKoDaCy2cc5WjKmahV
         R4Ru1TOLPAExuwSzRzjbEWyFuM4EMhETbTpBjvOsHyigk97+cIGAePKgqnOuKpVU/0LW
         V03QOSiFikjIukKn80qZdLtj9Z9M95nns6h+UEQD7bEwBRdReJmcP/rPCJI/FdFRLU5a
         +kgw==
X-Forwarded-Encrypted: i=1; AL+hErFAFFJoS/LxnvyfE1WWCa7F0xXfIQ23nFleIE0HqBIVkjuUb+ECqc2Wg2x92f9zr8wH6/HURKof7xP4ezY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wpRo3TnD4liaq4q7f2ToB4qEIeKChZdkTD4dV0QARDvhyZSN3
	+YynporBhWb703oqem9gW9opRMvn2M1t4WdwzT23TvqXbxkUib8k6T80outWyJokKUw=
X-Gm-Gg: AYBFou28TOGWKoeJvxb3hTKjd3Gtyj4owAKxyCc9fz8JjS2qqpkemGFCmneVEKBQkMR
	4UpxduXz1VCzZAk28qLm6QZQgLJaL515KBAQ8Pe39ESeTPZsS7dxvMkoBgREqXkwZAH5O5a9R1n
	nJ5OxVH3wL+9FYbEbMY20VgEFl+x8IJSJ0/SRZV5o8KnxAEUsUKsdhqNl5Cwtriz5Q8WpCTdSvx
	1aSR8gDvLIxPzuRl/GTGjxQDLJVvrNDZzyHqaPi5WIjR5P6Wi9NYvwJER6E/WKYzjKs4GGhoazt
	3KDe8nShHCr13lrwFwWENt1sCIgopG9I3L6rvZKGCmC9v8F8h81ryc56S8qc1HEj9xnYWCaE3fs
	+s6R144JjLzhzLOlxLsqxRPudKNEsQygmztNmCFyC7zPucT2hVvcRNpausUHmLUeCTq9ZjGWb18
	BaqemRGlH9KiCAw21mKU9ancz8A5Z5QC/DwA3NCJkchi+xL83KaP1ir1cMThKbU0B6Jke+niXLD
	fAhc4vAWGShfWsSbrzsW8TnmnFoNXF8Ruj86pt2F70Uq0PeOmZRayKfsotf8/cJRYS4G+iASXct
	A1aFUZL4s66+yZjkec8X+nfhv8CJqcQQQOKvtkdpupYGCQ==
X-Received: by 2002:a05:620a:130d:b0:939:4a44:5f99 with SMTP id af79cd13be357-949ba80f3f4mr678163285a.10.1795207906490;
        Fri, 20 Nov 2026 12:51:46 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41c105sm281433285a.39.2026.11.20.12.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:51:46 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 20 Nov 2026 20:51:29 +0000
Subject: [PATCH v3 1/6] btrfs: don't drop the error of the last split bio
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
Message-Id: <20261120-b4-btrfs-data-integrity-v3-1-4de4b91b826e@toxicpanda.com>
References: <20261120-b4-btrfs-data-integrity-v3-0-4de4b91b826e@toxicpanda.com>
In-Reply-To: <20261120-b4-btrfs-data-integrity-v3-0-4de4b91b826e@toxicpanda.com>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, 
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Qu Wenruo <wqu@suse.com>, 
 Boris Burkov <boris@bur.io>, Filipe Manana <fdmanana@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Zygo Blaxell <ce3g8jdj@umail.furryterror.org>, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1795207902; l=3609;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=UJ6i1DiWG74DgAdXg0wQaXbop9J6hAkPy0yoRBeCcrQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDn6dlvcfHiixWoRDL7RXBvKllSexlsLosj7VMqSPTGTXsEJgmyqN/0/5/ok4dnXYCWgbBTckAo
 ZnKNvyHgvQAE=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

When a btrfs_bio had to be split, btrfs_bio_end_io() saves the first error
of any of its parts in the status field of the original btrfs_bio. The
part that completes last is supposed to load it into bi_status of the
original bio before calling the end_io handler, but that is only done if
that last part was successful:

	if (atomic_dec_and_test(&bbio->pending_ios)) {
		/* Load split bio's error which might be set above. */
		if (status == BLK_STS_OK)
			bbio->bio.bi_status = READ_ONCE(bbio->status);

If the last part failed, the assumption is that bi_status was set at the
top of the function. That is true if the last part is what is left of the
original bio. If it is a split bio, the assignment was done to the split
bio, which was freed right after. If the original bio has completed before
without an error, its bi_status is BLK_STS_OK and stays like that:

  original bio (tail)                 split bio (head)

  btrfs_bio_end_io(orig, OK)
    orig->bio.bi_status = OK
    pending_ios 2 -> 1
                                      btrfs_bio_end_io(split, IOERR)
                                        split->bio.bi_status = IOERR
                                        bio_put(split)
                                        cmpxchg(&orig->status, OK, IOERR)
                                        pending_ios 1 -> 0
                                        orig->end_io(), bi_status is OK

The end_io handler covers the whole range, so for a buffered read all the
folios are marked uptodate, including the ones that were never filled, and
read(2) returns their content instead of -EIO. For a write the ordered
extent is completed as if all the data had reached the device.

This can be reproduced with raid0 data on two devices, one of them slower
than the other and with a bad block, by reading a file whose last stripe
is on the fast device.

The saved status has the first error of all the parts, or BLK_STS_OK if
there was none, so always use it, and drop the store into bi_status at
the top of the function, which nothing reads anymore.

Fixes: d48e1dea3931 ("btrfs: fix error propagation of split bios")
CC: stable@vger.kernel.org # 6.6+
Reviewed-by: Qu Wenruo <wqu@suse.com>
Reviewed-by: Filipe Manana <fdmanana@suse.com>
Tested-by: Zygo Blaxell <ce3g8jdj@umail.furryterror.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/btrfs/bio.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/btrfs/bio.c b/fs/btrfs/bio.c
index 2e12a6d7e16f..b24cba595107 100644
--- a/fs/btrfs/bio.c
+++ b/fs/btrfs/bio.c
@@ -107,7 +107,6 @@ void btrfs_bio_end_io(struct btrfs_bio *bbio, blk_status_t status)
 	/* Make sure we're already in task context. */
 	ASSERT(in_task());
 
-	bbio->bio.bi_status = status;
 	if (bbio->bio.bi_pool == &btrfs_clone_bioset) {
 		struct btrfs_bio *orig_bbio = bbio->private;
 
@@ -127,9 +126,12 @@ void btrfs_bio_end_io(struct btrfs_bio *bbio, blk_status_t status)
 		cmpxchg(&bbio->status, BLK_STS_OK, status);
 
 	if (atomic_dec_and_test(&bbio->pending_ios)) {
-		/* Load split bio's error which might be set above. */
-		if (status == BLK_STS_OK)
-			bbio->bio.bi_status = READ_ONCE(bbio->status);
+		/*
+		 * Load the first error, if any. It may come from a split bio,
+		 * including the one we were called for, in which case nothing
+		 * stored it in the original bio yet.
+		 */
+		bbio->bio.bi_status = READ_ONCE(bbio->status);
 
 		if (bbio_has_ordered_extent(bbio)) {
 			struct btrfs_ordered_extent *ordered = bbio->ordered;

-- 
2.55.0

