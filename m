Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554273;
	b=KNsRgUs+oN1RCBBzWEpOvK1PSNQCZsWuT742E2pnf65BatlU32oXCmCj/IP/bIwEHNqk
	 UzIObDhCWZk+d6rvO5i22RoxfIXSmbbvNczICiKE1CjaiRAxlru6YoE7UDWKwEM18ArKD
	 PhcBtB/kag0x/Dkd2Jqb901uIVs+9h/S0wMW1sFSqJeIdIIlBbFDsnP+E/8uc0fiwVk0W
	 SCXhwMWAWKP1GvM7sh0SueuDpe+ge4gj4KA3+ZyZGkulk5zDzX3VI6iOTvB3Z9zbwu4wt
	 xc8o3G2dFkL3WUsy5cRyiaM03js5H/GZA5AGW5Gm/RjcQXpKN470HcgBvqR/JW5e13g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YfPCZmxxb4rxdmgSeIDCjLwL3D9h2HXZSX4Vhy7qxFQ=;
	b=HogUCW2dTsM/MZaFwWfy4J/RcvHbcor1nqoNq7ecu0rTt4Mo5d4yxTaY1Ns1qNb0oPC9
	 ttdhpIYX8gR5QogFVRjMyIENW08OAdnFDsI2OzFr9q1kCy0LwNF5N2YGgqwmwiAvPcJrH
	 ZLcuV/Q9pyHRYyW7iauF8yR5LOUk6K2oVWT39hc2XV6j8Nk0RszsYk9o5BB0FOnT6G2Ls
	 G5qfczmHwMykIS/BipmweV7iZ9gN80MZaLIPfBFsuVFBoawmhBuUjrJiRfVDKD+uZbJcY
	 Mvu9zQHE/OS7La6pp83zRln0xka/9KtKy1L95KDTygmrnXww2xNJsaRs2rhhoad0CcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=g7uEj+N8;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=5lE0ocig;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA08606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA08606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=g7uEj+N8;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=5lE0ocig
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOKceCt2318757
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:04:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=YfPCZmxxb4rxdmgSeIDCjLwL3D
	9h2HXZSX4Vhy7qxFQ=; b=g7uEj+N8wQIAeY5GUbVLPpSD8mOAEr3g0spIbuYY4Y
	+AdmEj/9kfKCnTtI22MOveGbSR9PZknITXTEkyOwF171VMk4+fItxdjwsTGGT2ZJ
	Sk1psHdn0uDV+67kLzFQtkFVi4Znom6cYLzFHb97MdmX5pSV8T1iGXoCEoL2z6fV
	wOJVWMoKE1vqRqa5HhWRHpllSIN4FDv4FT1QncVrlkkQUGNHAirHvnLz2yoNSg1N
	ZaZzra+9zZu1y7SHL/0PI0jtqX94lJcPirUzOyHfgNk3B6HsdHPtGIHeF7Zwzwhl
	ManYR212EZYzeIoatDOpt4fn2uew/A4rdwGbdGoj7yPg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j5famsr5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:04:31 -0500 (EST)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92109408212so103734256d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795554270; x=1796159070; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YfPCZmxxb4rxdmgSeIDCjLwL3D9h2HXZSX4Vhy7qxFQ=;
        b=5lE0ocig+e8UGE0P7qby5YNR7p70797w6i9Lw5bO39ygYrjJailLevmJWXOMY5hTB5
         T80Bi3NxMXu6wmQ43krr7fWJshNIBMF6K7lF4LVVMLlI6mC/VzO+RC9KEpmJtXpuZdea
         ImzZAxpmORX2TYmgetj/4WhU8g3DodZ0PXcPeEfu6GJzxJQBU7V2nkxbZ3bjwZGMuXLL
         u/xrlP5KFUolopObD7MSzqp5zeiXw8YlDIQSCOtb0mzUn9vsRTB7dRu9QVk2ucgDhHIA
         +LveYRaanPtYdzOF0RAm/OH+W6gUrnfWpb6HB9SFTl5VqkFLDJudlSsklC9VfDNCuDOC
         R2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554270; x=1796159070;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YfPCZmxxb4rxdmgSeIDCjLwL3D9h2HXZSX4Vhy7qxFQ=;
        b=it9SucXybRdCR1vJYHGARUWue/n+LfhqLXSVck5X22WbPIfBUjUozY/ZFUEw4Xf19l
         V7aQxZ4cpTyrTJmQYtjxZ7NE6xQgmkFrf5nRoe+fLGKNsTUqjLYAh3AHdpj8AbSLbZi/
         pqeSapzNXu+ksu8fKyd/WlFSFqSnHiR9xHqfqvuPkGkjOo7k805rOfwOkfnt6TkRVykG
         1o+oasGisIeiI+Zy5rAA+8A/Ir/AIhzh17YhPudNUHVJLQGcN9LGql5mxAwgOMiN3OlD
         Zngy8LG4lQ+n3gicrTyxa3SKXQklF4dfFFkXnG9g9hnp4VLB2WLpSdJ+HZhYqwk0gmtq
         hWZg==
X-Forwarded-Encrypted: i=1; AL+hErEzxpYft/WxdxbLF1RiZBF8aiBKUfPH3QUY2fbYXfhD1SkjJ/cKTEZZoDuuqtLx4w0tH8GcR3PoOi7cav0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jPtKhG6y69mnYT/MhvfYkG4Xk9dMtcCMvQ9ROQ2pQXuOmPwEv
	qzk+0aL/gY6w7so7SW6KXMmvyUiTsVvkF6GsY6ALtLO41n8jaNk7AxdfLx/tguRb2pmmSN9HduU
	LcuA34n31vy+qYg8Wpg2I3lbaKDkiB1y1CTe1+YOC8YqAmgC26mc3kMSz/ILYrQ==
X-Gm-Gg: AZFdTZed8kBfJwFScXmHu0L9J1mFQ/ahMvJrbtL2vbRzyz4tWqaGpsFA5AmUcFCB41V
	P0sUTy33aflmMaz80/IywnHb618ghA1ap5jIGglvdE2GeeeK5JXrkSGCATAy0zoEaXDBD6WNZEU
	GZIui0vGlS/fZOhJN9/9bh14aI6/df2jsIlJYDz2SAuyUc1WQrn68it9rNDzUt8sbLXQ6ZyO7TW
	n7rOIq2+Vy7lRc0wUzUg0hjg0+apoZx0EstpdcXproQ4ed5EYp7E8h1wyKyfJklz69UmghkDuis
	n5cJ34ieOz2tn+qTx75ngabIXt1vWHHz7MU0uUNwXtN5IhOHGtFIfnHpP49W7EGrY48HvNJWmg1
	AOuMzTHBVAOwGCsJbLStWr8ZtTFc1GBUNblYtsDvu7XyNotHblOzV/9jhAeg=
X-Received: by 2002:a05:6214:2586:b0:91f:2b45:798f with SMTP id 6a1803df08f44-921349d1a84mr303818446d6.1.1795554269980;
        Tue, 24 Nov 2026 13:04:29 -0800 (PST)
X-Received: by 2002:a05:6214:2586:b0:91f:2b45:798f with SMTP id 6a1803df08f44-921349d1a84mr303817776d6.1.1795554269260;
        Tue, 24 Nov 2026 13:04:29 -0800 (PST)
Received: from [127.0.1.1] ([129.236.231.128])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a0a454sm142827326d6.35.2026.11.24.13.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:04:28 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 0/4] gfs2: stop using struct page in the log code
Date: Tue, 24 Nov 2026 16:04:08 -0500
Message-Id: <20261124-gfs2-log-folio-v2-0-f229e90c8285@columbia.edu>
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
X-B4-Tracking: v=1; b=H4sIAMj7BWsC/12Nyw6CMBBFf4XM2jFtKWJc+R+GBW2nMAapaYFoC
 P8uj53Lk5x77gyJIlOCWzZDpIkTh34FdcrAtnXfELJbGZRQFymkxsYnhV1o0IeOA6pSm6v2hbW
 ihHX0juT5swcf1cFpNE+yw1bZjJbTEOJ3f5zk5h1xKcv/+CRRYF44kzujFeXF3YZufBmuz+RGq
 JZl+QHZNTxcwQAAAA==
X-Change-ID: 20261014-gfs2-log-folio-274b84f5cc07
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795554268; l=2556;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=7FO6/luyWyYiwy76McXgSi1siYuPq6HjMqibCHp9fZE=;
 b=sa/Hdt6+MzITp2xUSjYeaHYjKR4aGgDtGKHx7HykKnt4rguIRaPCsn+rx8T9+HrMR1ryUXA+8
 LfgELZNbNdwBGeBZYLz2OLTyiL2+SUYfRY7UPDszmA/7nDKWdB8SIG1
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: f70Bo5woC2nH8KSVUWAGjq80Xz179ho_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA4MyBTYWx0ZWRfX5+0OzRAkLTEj
 ixRr1A+8BXCgSBZFoh4MVFRI3i5+7jYpUTQIej7DfVPh2FXdpXTydAS24fFtvZVJXOwsJH52rAa
 UvQ3FVXCmYzGdsDj3Ff3N0cv/4a2af9vUK+VN4jVCAzcG+/aTgoB+yhVXSny4Cnio4aIcn08v2f
 r8oXwcFwdHEvwrZwHq9syMLRYow5tKHxldTJjMIwbBoN43yDs6mR3OH5KjIaHvQ7jAqVI2lXHVY
 NYzyr5azt3+rCZo7HAqC3Y47boJJy2mt5Q7j3eRP1vyAfLcSfbQwy0jgXCW2r0wJKiFqFM3ny0E
 D4v5H8CMxH/WifP3taNmRi4Z+FhKIF1q0boxkJA8TBThy0zmpjOr4YGANFlJZ0lz1Igy0vcky7Y
 Wqo/sIoRuWqYQAeLtRyPxpNOgWuxQbwimQEwWD22E/SxaDuDedJy97VMhtYdWA1PBWsWrUV/UV/
 7SMQDb29QQK/AK7o9pg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA4MyBTYWx0ZWRfX0T0OsjetzywQ
 GgSU0DfelHw87cKFSWr0fu97gieHtVwQXw6MYKJr1ZB2BVwQp1pXXaywlWo52UPsq3e0MTxz+mg
 Apcax/9SsGQPilfr2ORXd5m7Xwr+Xucj/+htrdNhucbXwn6k9C8X
X-Proofpoint-GUID: f70Bo5woC2nH8KSVUWAGjq80Xz179ho_
X-Authority-Analysis: v=2.4 cv=OoHaWC/t c=1 sm=1 tr=0 ts=6b05fbdf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=LNQXEAmb7IHcZyFqmLK0PA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=bC-a23v3AAAA:8 a=RFVG-sN2wyKfNfnTff4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11976
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=10 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240083

This series gets rid of the remaining struct page usage in the gfs2 log
code.

The log headers, descriptors, revoke blocks, and escaped block copies
are allocated as pages from a mempool, and they end up in the same bios
as the page cache buffers being journaled. The completion handler then
calls page_folio() on every segment to figure out which kind it is
looking at. That won't work once memdescs land and those pool pages are
no longer folios.

Patch 1 gives each superblock its own mempool for these blocks in place
of the global one. Patch 2 moves the blocks over to block-sized kmalloc
buffers from that pool, with their own bios and completion handler. As a
result each descriptor block is now submitted as its own bio, so patch 3
adds a plug around the log flush to let the block layer merge them back
together. Patch 4 cleans up the leftover page references in the log
code.

Tested with fio 4K write+fsync on gfs2 over virtio-blk and null_blk.
Without an I/O scheduler, patch 2 adds one write request per log flush
(196.7k to 229.5k for 32k fsyncs) and ~10 us to the p99.9 fsync latency
on null_blk (41 us to 51 us); the plug in patch 3 merges them and
restores both performance numbers to the baseline. With mq-deadline
nothing changes.

With a 1k block size on 4k pages the result is the same. Patch 1 changes
nothing by itself, patch 2 takes the write requests for 32k fsyncs from
199.5k to 232.3k, and patch 3 brings them back to 199.5k.

---
Changes in v2:
- Patch 1 (new): Make the mempool per-superblock, per Andreas.
- Patch 2: Make the per-superblock mempool be block-sized, rather than
  page-sized, per Andreas.
- Link to v1: https://patch.msgid.link/20261117-gfs2-log-folio-v1-0-35db3db42e35@columbia.edu

---
Tal Zussman (4):
      gfs2: make the log page pool per superblock
      gfs2: stop using pages for log buffers
      gfs2: plug the log writes of a flush
      gfs2: remove the remaining page references in the log code

 fs/gfs2/bmap.h       |   1 -
 fs/gfs2/incore.h     |   2 +
 fs/gfs2/log.c        |  19 ++---
 fs/gfs2/lops.c       | 222 +++++++++++++++++++++++++++++++--------------------
 fs/gfs2/lops.h       |   6 +-
 fs/gfs2/main.c       |   8 --
 fs/gfs2/ops_fstype.c |   6 ++
 fs/gfs2/util.c       |   1 -
 fs/gfs2/util.h       |   3 -
 9 files changed, 157 insertions(+), 111 deletions(-)
---
base-commit: a009501c151f7d19519312ccfa2070d30d62b249
change-id: 20261014-gfs2-log-folio-274b84f5cc07

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

