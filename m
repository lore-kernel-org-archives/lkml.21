Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207914;
	b=fu+wU2B0ReowgboHXLR5H4qpxs2Pxa7ldxWXSk6gISoRGOuB1K8AQw7EfiWF8j4wEUGo
	 COzLEDjf8UbKWkG9r/BUn8KvCiSm+9A9tSI8ukpMx38A6d311ZeCJc/iuQDAOFBM1FUfh
	 scbx2iJIqstiuAAYK3QD21m69JYggom8JAinVNEPH253WHD9Cci97jsR//gjOUrLgaQJ3
	 uuU/vUkIEh4u6PZ+Jskxy4LsOdUvqcANKbhBTuhu+A1OKMFjbhy/PAVxMNGKvIQAqmM5T
	 XlxzxSdwOPZWReyGBdP856kV+rK0Q7kO6BMau4d0qnovhNMV2dEIV6va6YNBSbEqqvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=eyUZ7G9iu0uZKAz8I4enYkWl7REhlZiOYtfQA4gLnsc=;
	b=HBM+qmPM3YAgO3QPqGy+2aSjL3E212TLfQwAC0Q7rs43R7xeJ71NsBXq9S2Glw1khKcP
	 B6sn7Z4fPOazTiNpIfLg0TYeMKTT9rG9X+LMNRf5zFm1VWG9hE7BuLGThoPvJvLvwgqHX
	 iQPHvqOoIff1Hl58/HFQqeYeCUN9YNXs8yBTl0aHspBQLHKrE6JHzNnovdhAnl4ckK2Kz
	 QPyERM1KAjuex0I/F+6ZN7NsLbE8MR+mFutg3HoFLdoXm+vVhfOBbHT3ExXm+6gIP5HWr
	 K1g2Byt6BvX3lR2OAXAdFd7jMGzI7xaxzi9LrvSK8KPT8F1YvfL/aMwxnQ3Zp9fJuJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Z+JPX2uq;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D865A606A687
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D865A606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Z+JPX2uq
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55d3563e50eso8300391cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1795207908; x=1795812708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eyUZ7G9iu0uZKAz8I4enYkWl7REhlZiOYtfQA4gLnsc=;
        b=Z+JPX2uqFgQUf2qBa5aPjGm8brVyUCVrt4Uvi45wDyt5e56O1uhY6dCBzRCKTJ67lj
         S61/2kSfShOdrcbRjiMN7jQb9H/uc0Asteuc4l/pNrQIGMJZcFeDty8MaUkX+vWHi6Qk
         a/fyDRAAHKzImSu8CTjVMSeaHezN254HfpvVzKICwA/6S0M8FcdEfTojNSRoQ+VdH1TY
         Hg0oEO+EfuKw+BmX2XRpFxTfUmkeTXJQILrLIOYb/XtbXSCZyUsNojew+0q+wTjTf+zD
         9mLtnNBfJUc6+7BM+NeMOjqS6Wuaadd0l2FBXYkUJah0GkSZjyBjy4vKnL3MCzky56cP
         iCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207908; x=1795812708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eyUZ7G9iu0uZKAz8I4enYkWl7REhlZiOYtfQA4gLnsc=;
        b=k/6HQ8skQbpSqaElUFgIqMIbK+6gaeynSAHhjalBtpHEJBqA6f3+Uzme3NaYHk/dum
         rZ3cVVMWJ4pNKpQlbUTUiPG2N5WnnOqvMYrjCFFqo2jLLQytlEiU7oU+X5k/dw9smMEE
         hp3NL02Rz7NY1dxqMmg3K845zuWzVRPnqm1mb7fMuElqFOKQT/8Ku7mEbKIfGF7tpAOv
         8Pk7Bb/MFFh/6SHrnui/rXPY1zgy8HdSF77f4PeDW3F24vuGde72m+WS3QI2PPOzS7/i
         rcN6E0f9dZgw8ytKCO7aZ0VAvnDND3TgkKmrl3tpA7rw9zUiKbwDiEiqUFlY0YMjq/w/
         BP/w==
X-Forwarded-Encrypted: i=1; AL+hErHSNic0DqSDwvVZcpI0OLOxIKshKsHnFZAvRYJZBWaOmNcCU1coKpDY8mKYOqvKhLtnIVj1zmzCyLRP5tY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UnOPeKIXryA31LYYFDJk45bqwkqnzEJp2CWjzZ8nQssSa7QlU
	t1pTT50zMS656XVWKJxlnyjKqsoU8TeQDGIUxkZAAdR+KutjdSu3JDNiHwe6gGkaYlI=
X-Gm-Gg: AYBFou3zN+w9iERByiZLK5aC3hCc8qLDK0qH+3h5DnW26vQQK9G12hMpl5z8E1NP9uE
	XetvGB9f9yUuscPM7uNHJIGa1OxaqMdxdC9JQsZjTz5ZhP5EZFzwHih7o4FqYWVqhWSvEBxZIn/
	5Dy0ijX/l8PK2pZnl60cN/7chyp4PQQ/bbT+Xjj0M18X/+grQGRCHhShhnXln3qLfuui9A5wNkE
	AUm6ic3GwGRJ0lfwzzEGZUJUfYQ4f6VIr7AB5iLZiJga7l9fKevr+YAztF2WiGKDtBhdGNkyT1c
	pUy3c/+2HO722aTmn5WgCUrKPddnKIWu5/KLUxpmtu7BiWfVOuhxrgE22svNO15oScu/v0vMRLR
	wLwFowDgBca9qvqRWEWHrlzTBcOB7LNq/TiKSolqY7p935R8c1DAUKTYXEIPq78WuY/yCv766rl
	N1NaMLttmUrQkTKo3BfAhrBBP4W/uzk4UJrWXVgg36ay/zTb/7dfkUCc62JzzJvNTwFsoHeFyvA
	w3K/xIxoloDIRIQZU5iUFY1kwHnKHyyahtAFV8LIxYvBgtHP4drtnb29GNHlrNYPA5H3HBNXSG8
	cDAA6Vk5NaJRiZ/oN4DHpyatCmGIkKjE2eViGol88gCZ7Nw=
X-Received: by 2002:a05:622a:684d:10b0:55d:7c14:85aa with SMTP id d75a77b69052e-55d7c148660mr42515981cf.51.1795207907754;
        Fri, 20 Nov 2026 12:51:47 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d784517casm32269551cf.3.2026.11.20.12.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:51:47 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 20 Nov 2026 20:51:30 +0000
Subject: [PATCH v3 2/6] btrfs: clear dirty blocks after a delalloc failure
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
Message-Id: <20261120-b4-btrfs-data-integrity-v3-2-4de4b91b826e@toxicpanda.com>
References: <20261120-b4-btrfs-data-integrity-v3-0-4de4b91b826e@toxicpanda.com>
In-Reply-To: <20261120-b4-btrfs-data-integrity-v3-0-4de4b91b826e@toxicpanda.com>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, 
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Qu Wenruo <wqu@suse.com>, 
 Boris Burkov <boris@bur.io>, Filipe Manana <fdmanana@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1795207902; l=1729;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=lfsEFhyOfftP+0hFE5S+FeSjbmCQrO4zPPBNoXWEW6o=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFtUlv0JwXDje5hCiQ4tr67g5MCERqnXG7hDBVQQQO/oSjgWiz+GtFA4bFxsNxd3z6def3tOsXI
 hhpioHWyGrQ4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

If writepage_delalloc() runs the first delalloc ranges of a folio and
then btrfs_run_delalloc_range() fails, the blocks that already got an
ordered extent are finished with an error through
btrfs_mark_ordered_io_finished(), but their dirty bits are left set. The
next writeback then submits blocks whose ordered extent is gone, or is
about to be completed a second time.

Fix by clearing the dirty bits and cycling the writeback state for those
blocks, as submit_write_sector() does for a block it fails to submit.

Fixes: 72dad8e377af ("btrfs: fix double accounting race when btrfs_run_delalloc_range() failed")
CC: stable@vger.kernel.org # 5.15+
Reviewed-by: Qu Wenruo <wqu@suse.com>
Reviewed-by: Filipe Manana <fdmanana@suse.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/btrfs/extent_io.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index b2739838c646..036d8c0f04ae 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -1746,6 +1746,14 @@ static noinline_for_stack int writepage_delalloc(struct btrfs_inode *inode,
 			u64 start = page_start + (start_bit << fs_info->sectorsize_bits);
 			u32 len = (end_bit - start_bit) << fs_info->sectorsize_bits;
 
+			/*
+			 * The blocks are not going to be submitted, so they
+			 * must not stay dirty. Otherwise they are written back
+			 * later without an ordered extent, or worse, with this
+			 * one if it is still around, and invalidating the folio
+			 * would account for them again.
+			 */
+			btrfs_folio_clamp_finish_io(fs_info, folio, start, len);
 			btrfs_mark_ordered_io_finished(inode, start, len, false);
 		}
 		return ret;

-- 
2.55.0

