Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200139;
	b=eun1DtTuWQFjQnDFvHCce3vjiM24Qhjt+yClF0pxtLcDf74ysC6SXKjmXm1gxYdrn4WO
	 eFIonMRhFXYeUarc/gG4dxfWsq6clHU1XWfEfOOX64hWwpeqvxAyjDd0dqqTUdNv5mhAt
	 cUl9bGbjXej0LBw7eNcKIVmJ/iFrbdZ6Q61K25YhIIzirW4NvQ9mrXIlkbNOqRe7JRDcC
	 msBL8YpGDeXIsZFMu1y6c/5qf/iiVdDMAuaYvhRo3sI2ZqKDZkpIVZFcu2zzl8XZRRVMX
	 i7rGF9aOCw8AKiT7fUbZiisHZ05/dWNoILLIS1wthYgzGB1j4ZLzu0rG3d4YJkXScQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z80gyuIqWTFja7sZqkIB5MePzAprHfhp31UStX1NblI=;
	b=JmUfKIyl0+oEXQxfdYX1cQujNbsW+fymgdRKq/3W1NhttAaFdWVyN14jWD37OtJOu74b
	 Y9uwdoTFk9GPYnzyJ/GNbZ/PSGOOm5SFuWye+tIZ9aIwyxN8F8Qndg+FdCjP1QEM6bCzi
	 pFQJD5hCectZ42evhsrlJAMYdzc96Q2I6CMhrSEqJxYfTt4S6S7No5rtmYkPllRAEGsb+
	 0/JbsoxgiXR4u/6KdKO8y04lTqyKKY1TUosq733Z934A8nSU3iLFz0yMoqth2d2F/ZoiC
	 3MwNv+9V6ZQMZctaCRZQLmiAymGV3JTpmGUE1TuIEDGZVDUI6k5DTzvz/MModtzKrRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=T5o6yG9n;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=ua5D4q+T;
	arc=none smtp.remote-ip=148.163.135.74
Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0946260A2615
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0946260A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=T5o6yG9n;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=ua5D4q+T
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKHYSr2933801
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:42:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=z80gyuIqWTFja7sZqkIB5MePzA
	prHfhp31UStX1NblI=; b=T5o6yG9nrbMSKzyS1f+5xRTAKiCKwanE7R3ScqNrNt
	8HaVthg1JsR1O8AHAlGKMwF2ACDl/hgsBGxJvvzmMRjDZnjGu66cse/JG/6Zw4DW
	Oe4U8/vYwOVdBvorzbhItA4FccEwHuJPug564ikBAJtYXn3Q/6inqqJhjE6QAS0Y
	owjwo0+UOAn3UonbstwZUbPuVAHGlDD2jrNuduYG0lObw4GCKwWpsUiYGFhvr0KN
	3yz03TphBd/3aE4oYUQOp1orNuIcEpnhRRq/YM9Nh//0g+JfDQkYxTQH0ucOFCy3
	GxED9Xp0aDOkAQTIBqB7+BNxzFeHt/Si1c9uyrxLlZWw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4j2ss594wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:42:16 -0500 (EST)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d2c49c3d9so17945991cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1795200135; x=1795804935; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z80gyuIqWTFja7sZqkIB5MePzAprHfhp31UStX1NblI=;
        b=ua5D4q+TvOxl5HuvJ+f/RwXcRcOaiknfqgtqvMq3YgyrTCh7pB1Lgfum9y0uJEkio6
         4ZfxVuCAdJcN0FLWAQuV+LrX0kIRgAn0hG8SAatgLQa0e4QdiPkSBQ92vMkZI+2eFyhJ
         PYSldqRvLlhgnS5yl5hZrb3d1iVynZKZ52oBGBoHkKe+NN6ySt0fYE9tZELqI+Fcctaa
         FEkUteHNTfaRDk72nMQk05dAt2jJAoAkM7yzr5NGL8ZImDzkWHu/iSYrOpt97z15M/on
         hH9Lp3+7AEmND2elbTuH8B6f0K681+n94IT1HWX+Iyiy0e9DlF+WGCGyfFZBIYgyFVDo
         M1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200135; x=1795804935;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z80gyuIqWTFja7sZqkIB5MePzAprHfhp31UStX1NblI=;
        b=th06xq+HUexEHFZ5tN/XUjjsE120DYVn3B6GWUZpIgyMFlUkr8xFidsl3uOARLVsTS
         6WnltFplRJBujnsngVqe5Pg0p8oAKtyFzYaISRdHHG/oIHwC/NG2F+KnM0lX+7FU2H81
         wuHZ4K48fKpq4+SmvqO9C5Jclbh32bRVqPa5Gb5onjfDtXDpfwXMEnf+1e86Zikx6EX7
         vryLITFNIKbm2S9gMy2yzofscFQJn+7SVP80YBzHR+3rchYP4BNIEzR2jJfHTCPKpXDN
         DoDdgJ+pUu8QkiPI6Q1HNw5mBtJQupaxiH7FqXHpLPYngbCMgeYR7oZYEzxfQ3e9SW9r
         3vhg==
X-Forwarded-Encrypted: i=1; AL+hErG+kQIoiPaLjQyKa6e0IRo2WAuXReR0xxa0sgboaWzonDrE2mqRdvY227I1WZ1ypxhe3vmmr1VqBu6C4b8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PsVOkX9XHYjud2Wq5pYN+poW7sT6AsU+sxAgEzxCGZHVTayqU
	E/8oqLQpodhgQOWlQG0f8+K61/IQsuAkktNDdqYN8EjMjrBq+4wG2m6pLTTMShj2Vwjdylqc/jR
	cqZ/RIbxq9p2qnt3/rOcbUYA+xIoJbtPR3o/c0kPd6h/5rUX/Mtt+FJx4PcL7bTQhI599Ww==
X-Gm-Gg: AYBFou32oT3Vgm0oHn2nSpphQN8RcPMaJaiICWzBy3TDS90mWjrTcZkT14fuRJSRcAo
	NqiS3VUrUdgomSGcy3AXTc4ZiLscDI+zmp+oZjDhKZB4BThdcVScLyStuJVk+J/ne9vCJcajxJR
	gCdPbdnoN4yhq9NryiZ44o4LO88ijdHWZbRzCc3roXa0SUJAFWOPUSo1K7l3jN6W9Ig6FMIR2wO
	VqdOSOcJs0N8CB87AIMLXWNTOLX48hHLp89vO5TOWANtsGgD+RgDP9XlmHVvTFzLdwhsJj9ey59
	ntOWXfBo3yUALWjPqvzA0ExKImOhFIKPx8FVstqC5HjabmY0tOKbspBu0ulHuDSatNsAncWm76r
	vKTRkewtoj+LpvxHVUAvdADxiR/dE48DnF8ySOD5yHxv6/SH6o/pf9ygtxJXyYHqt7JBGgOlTsx
	+JOLlT5R3y9+wnQekGxoOe
X-Received: by 2002:ac8:5753:0:b0:536:6946:748c with SMTP id d75a77b69052e-55d76a343dbmr79596311cf.53.1795200134990;
        Fri, 20 Nov 2026 10:42:14 -0800 (PST)
X-Received: by 2002:ac8:5753:0:b0:536:6946:748c with SMTP id d75a77b69052e-55d76a343dbmr79595971cf.53.1795200134582;
        Fri, 20 Nov 2026 10:42:14 -0800 (PST)
Received: from [127.0.1.1] (nat-128-59-178-217.net.columbia.edu. [128.59.178.217])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788ae02fsm28895301cf.29.2026.11.20.10.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:42:14 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] md: superblock page cleanups
Date: Fri, 20 Nov 2026 13:42:05 -0500
Message-Id: <20261120-md-sb-page-cleanup-v1-0-117d8d686737@columbia.edu>
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
X-B4-Tracking: v=1; b=H4sIAH2UAGsC/yXMQQqDMBCF4avIrDvQZKGkVykuMsmoU9oYMloK4
 t2NdvnxeP8GykVY4dFsUPgrKnOqMLcGwuTTyCixGuzdtsYYh5+ISph9XcKbfVozsotEnSMbBgf
 1mAsP8ruiz/5vXenFYTlLsO8HtsRedHYAAAA=
X-Change-ID: 20261119-md-sb-page-cleanup-e9dbb79b2cf9
To: Song Liu <song@kernel.org>, Yu Kuai <yukuai@fygo.io>,
        Li Nan <magiclinan@didiglobal.com>, Xiao Ni <xiao@kernel.org>
Cc: linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795200133; l=901;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=/S0qzvulfFJ+jOnMFaYFKELpLXYmh9PO4ZKS+y68i6E=;
 b=VUl/F2PKUXdZOgz3lQICD6po6ewre9vgEIKEWq6ZhFTzQNvJDn1wP014zRKDa9iSYh4L84CGu
 tUwfO6wwY1xBIMuvrCpjWkYsWYfP9de/pEfaNYvvtX/28TjgSVxZbQu
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NCBTYWx0ZWRfXwg6OZDLnLFMl
 xtTmf9xTYt3A06fdSIVDAaPwt0EmBSYj1S7pNIUUNHDRyy3vODBJDa+OJVB70QTLnCuvEQ2FAAE
 DSHcfTVC8aCz4xjiEKsLoVduthsruOf6ZRjhK/EvfWlptJvlTH6mSx0x9xgs3yCJ3JVpb/SlfC7
 y18c7tWRBTdU0XkxzgHucWnLLZ090jZ8++SsnBICHvFOuWFzW88BjwuQMC8FGQQD327/VCWhx4A
 zT77uTGyqXNJ5NBMXIiQWDx9yDzkzXynXcaBaHS2iN+rC5KyGahTAz9QKpv35bBWwVPwCQkrnDJ
 fgeONadRwwSWkbN/L8X7S80kKQRNKpC/sU81xFauxQWRO7rrh2iwc08VrNeZBcdthZZ2WtQWlTw
 9+JV1c87yIa7iS2na4DjK2MEM+cXFmuMSQcDo2+bA7pAOK9NzhdaRbfoJyvGBNzblS6fgAiHrYL
 fWbEteS0yVzeDASB25A==
X-Authority-Analysis: v=2.4 cv=fJasTpae c=1 sm=1 tr=0 ts=6b009488 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=lnglQuR7XRqnmjDHco/WZg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=5_fZDExAL0lJENZ0V4cA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: oi4hnArfI9JNsXNK_xE1XMnMAOYVLDxW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NCBTYWx0ZWRfX5Z+9KBiPQitc
 ttrkq+BfefPbBmOv2I3tgAmttFWZ1+jtSz7MA2rdee0Ys262jii+NO/xHY87R8dbTSzQOM89eYK
 mi8TwBb0BJIcvM4caQW/o9t2CIceHA+q68bZCv4kh+giPEaP+BbF
X-Proofpoint-ORIG-GUID: oi4hnArfI9JNsXNK_xE1XMnMAOYVLDxW
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11972
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=10 suspectscore=0 bulkscore=10
 priorityscore=1501 spamscore=0 impostorscore=10 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200074

read_rdev() clears PG_uptodate on a superblock page it has just
allocated, which does nothing. Patch 1 removes the call, which is one of
the last users of ClearPageUptodate(). Patch 2 frees the rdev superblock
and bad block pages with __free_page() instead of put_page(), as md
holds the only reference to them.

These buffers don't need to be pages at all and could be plain kmalloc()
allocations, but that is a larger change, so I left it out for now.

No functional change intended.

---
Tal Zussman (2):
      md: remove ClearPageUptodate() from read_rdev()
      md: free the superblock and bad block pages with __free_page()

 drivers/md/md.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
---
base-commit: c526b7cd32f75fea6021ffdab287b81cf38ddeb7
change-id: 20261119-md-sb-page-cleanup-e9dbb79b2cf9

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

