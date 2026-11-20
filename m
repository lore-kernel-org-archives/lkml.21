Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795154923;
	b=H7v6G+1HiVNckhQjrpfDw38qw+nDLn8YZM2oY1FTvXTlgHZQ3abETkpxLp/kFsw4moDD
	 IdaNw3cz9iWSBR7XILOzuJ2xSmJnylzzCL4ZGLRIILUCyzbTR8uinaypHp5IHxfl2SXm+
	 ry/FJoDs2kQpC3rVt7cCa9Ea3pmXuPNkEqLwlM1KH5m1E6rdbT1ILlf3U4X5ar6lpW1ru
	 YN0iVju3LZ8YOCt4fHQFEu+pIP3BEG7oEsr7beuxBVTbwy+vXfj2EIh+GQXTQXn6vuTlq
	 lJzC+x1Ls/+8abJ0iJQfIe7nVWRcQ5cGmVIy1YsUv+mIr+gDVOX5B4XWyLHzyrAjUFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795154923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type;
	bh=p95UrQA2ZjM3sDJiu69VdilYW3D+lfsUq1prVd9Q3po=;
	b=OfgM2v+XEws1WpphgPOEKKk/aIb6IxLmRlamojpGDxss1mBcTjJlZGNL4Fl0GX367k1V
	 hydUaZWWOqZkrxRhuZQsAbokhffkeSbIDlMGr3Dl1GNRnPk9g+f2tf6ssToXIci8GrrC0
	 LQ1/Gt6Q+0Wup9KTGr9h/nJwduzxNNll/D3et0Q1VQiZW2XIXFeJ8LNVV3ZstGqAAcgm1
	 ISRvq8OyK/Yw1WGriNMv58CB6GKb3TA7H8GZM05S57PJZEwWybq3S4ZSHYEWd0DGWIfvE
	 73qKnMMKAbp/fmDgsc5ylopwN+UfsqcDJEIEJPPIDVbzqLZiBHmOsEPFvqXvUrc2LAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uK1sqaEM;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C864E606A524
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C864E606A524
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uK1sqaEM
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f048476ab9so1179335ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795154922; x=1795759722; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p95UrQA2ZjM3sDJiu69VdilYW3D+lfsUq1prVd9Q3po=;
        b=uK1sqaEMgQlc0lh6kj0PznYNzSKUj0cCbMBEpTQcZdFRbFpLmuQY4atHeCFxaxeBAc
         tDL3IMvr71cBBe5q6678FpmHuxTSuGDN6kZtPlJp+aiZj4vzGwg8izMKQFm5pJ2+Y5eO
         2ZhMgEc5X/kaoKeCvOoulutfwhBu2utktvA+LFVLTEsa/UkpsWxbHpJBi+iJ08lA78Sf
         +4CzMIcz8vZ7q6dHYNO+cQ1FYQVGvpZDMbQmSFoZU6n1z6hl7Cf6yKl+VtptTjhp3mS7
         qMywt8pwbi0+2nIDUEGRceWblaai7cs/tYPr3xyXp7/TxkrA7Kds7HhSkNARDJRViNPw
         rojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795154922; x=1795759722;
        h=content-type:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p95UrQA2ZjM3sDJiu69VdilYW3D+lfsUq1prVd9Q3po=;
        b=kvCtjW5zFcLP76cIhSlIl95cXdi7l2opfY8SigIzzKavMYXTTnhPDBwvi0g20bR835
         +pMze1wVcDz1VA9usAQ8pfF3bjreBC23aQ2xKLiI3Djp9m1JZNFMrJ5369dlZXVgjVaU
         DgLqgVCFxUlQjv4O2bzB/FnhYsq6x0ZfM1KjoGrl7FJef6D+AsTuO0MYMdTXYL2Sv8l7
         H51gIoCldW0YJUwpnL0pRut5xNz+R/vskwFw8AGUEOm8biolsbsQbvnkN1s9tFpmq2cL
         f+G4nA/vMzbsCgYYZy1PgdO33Zr8g4Svi3irY88/QyRy2oPpERqt95LEghqXKnL+1vNd
         maRQ==
X-Forwarded-Encrypted: i=1; AL+hErEpVPYodGA9XjEhIfHOoiZObmVn2xhxU+nohxRZKgg155bcRttOB3m7RxSUaBWj7DiXzlS7vPXV+/CfPRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7EFz5sa8+0wP5l27c79iW2bATBH7/9LXkrrY6hgr6HwtZebZf
	aX2kfNRudD+f0bYWkAM1dFGTtDa6GkrgtUIp9xeWpZ8krngALiw43Tlg
X-Gm-Gg: AZFdTZfnsH1lw7S4d2UfuZR3XSmTaLgyCa4bqAXP/RII/VA5K7KWk663wHJmcaDU7Ka
	vUo36TtHECV8W7JJtJUDm9nr07BRefpAVmJK2nqGUHnDWeQIR/M1rupS8yve3mJ5HmUQ+YopYv7
	f27UlQNHaAaE1DXx7aZf5rtqRjSbHJOzcWfEzfcqch/KDtAZMs62SgHUTuspLPboO4tE+ZyPSu7
	a7iY+59Ejxgjuu5++IlD/Iqel4wxmnkrO5FOW7KJF/eeGjFcpdEBMXEyD3jZG5EVu7QuKmB0QOv
	buJbmexgOxKuiTrjEKP7PEoT7DiTJygnK0zbAufpfys3+HMdafOmnH6+qCCtdFgM1YqKze6Ccnl
	wKsW0D1eRK9V+F6Xdz9mbWr6mj725eec4EpHC4pHmEC80ZC/GGeNb6ijYy+H4HvNoIMwUVCK+1v
	Qo4lJjlkBx3B4lO79NyhP6h1zuKFi8rUF69qpbjpnKulMtK/x+Jylbn+zZ49JymeuXuF5AZd3So
	fOy+pGdS1bPnQlWiESc0MUaLv0GqSQHT0d0gbesXE3mkuXKrTzEOsoAdF6flI9b/4LyKubTBPMa
	PHLtKUCiG8nbUtxOrb1fz7yE0GaxvO025TZBB3uiTJQXEooURQTskk1zDk+h0U5DJPrY4nCzLk+
	2x1xvqHh99WA=
X-Received: by 2002:a17:90b:1c08:b0:3b0:9deb:d990 with SMTP id 98e67ed59e1d1-3b41cafd549mr1739331a91.39.1795154922012;
        Thu, 19 Nov 2026 22:08:42 -0800 (PST)
Received: from DESKTOP-7QP7L26 ([45.190.211.142])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm6322499a91.8.2026.11.19.22.08.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 22:08:41 -0800 (PST)
Date: Fri, 20 Nov 2026 03:08:38 -0300 (Hora oficial do Brasil)
From: dev12124 <joaoanandalima@gmail.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
cc: vbabka@suse.cz, david@redhat.com, hch@lst.de
Subject: [RFC] mm: alloc__by: create a function for allocate pages in small
 microsseconds in boards no-MMU 
Message-ID: <1ee9b247-6758-c146-2d03-0acea98db33f@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="7872875-14611-1795154921=:13716"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--7872875-14611-1795154921=:13716
Content-Type: text/plain; format=flowed; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT


Hi memory subsystem,

Actually, boards no-MMU do not have an integrated MMU to translate 
physical to virtual addresses or support hardware paging and; for this, a 
few points:

I. Requirement for Contiguous Memory
Without an MMU, the kernel cannot combine scattered physical blocks to 
simulate a continuous space, making the search for and allocation of 
larger blocks very slow due to fragmentation.

II. Demand Paging
The system cannot defer physical allocation via page faults; instead, it 
must reserve entire blocks in advance.

III. Use of simplified allocators
such as SLUB_TINY or linear free-list scans (instead of the standard 
SLUB); it saves space by 
scanning simple lists of blocks, but it performs very slowly during 
allocation.

IV. Proposed approach
The function alloc_by(size, address_initial, flag) haves:
* pre-reserved pool per size order;
* cache fast-path no global lock;
* bitmap O(1) of free contiguous blocks.
This bitmap, more specifically the blocks, have the pre-reserved pool (per 
size order)and the pool have word 2:
* Word 1: The initial address (starts in cache fast-path)
* Word 2: The final address.
For example, a Program allocates 277 bytes, the alloc_by() enter and 
verify the bitmap -> viewing the request is 277 bytes, the aproximated 
size is 512 bytes and alloc_by alloc 512 bytes.

Thanks,
João Guilherme da Silva Freitas Lima <joaoanandalima@gmail.com>
--7872875-14611-1795154921=:13716--
