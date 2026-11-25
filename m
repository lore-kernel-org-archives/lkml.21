Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625564;
	b=wji2rpHSWVGzGS7CPdjFL+AGApfQKkZEJo9EhtrqE77pnGYaAO8IN1Mi0/BpuKBzy+6h
	 BWoiR8v+wIHF2DwpMSK8TmMLeXQRNivwSAPywOoXDaiUhfY2rlPrEQ0wNxroi6FoQRlff
	 PSHoLX0mamAnsSFek8Ca/HViANFMwr5mm+T0PhzfHq4b2+xNEhGDKmSQRinP5smtUKyZE
	 ttTZe+Yg8kjyLkFgFUb8PpigepDJCGjfXaaqPbxh2XiJZUDpC55ab4MJyBF+aBv8n75u3
	 DQleBatjdbwOgLKbX4YKDDhjG1H9gR/0KTZwCmKigH5kMBWCdo54ZEj6bJVCm4xep/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FmzksWMBsSiVIlu+GaCNOdtvoguP4P/t8qvh5ZCxiSg=;
	b=nygMuBUeKHB4uzix+C0GIZXuLotdc1eSIuqMgwAPGYzXbRH4Dvu7L0CQluFCuVMDQXhJ
	 de3/For8+hgqAK0hgUsthfAXgYjSgSjggufg5TNruI/KTKIuOKm8hW9mI+5EJxSEXQ1dG
	 q9bqz0/CXHBMP2jjMh3H7zo074EH3dkREOPrDhMYKp1ztO+OINiLuwgFtp2bcQ3OYRVpp
	 avzRb0H5ob3DbYjZaZHVFUKnA77KEnyu5k9tggWM/O+geFMmfbWB/IJc9EJC+m6UqbMH5
	 VuQ55vjWqmeeyFrX18iWOyz2Ja6EWPbiXu3UnfNrYB3kVHZATs011muuw/hYlkesibg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h8vTj9X9;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB86B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB86B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h8vTj9X9
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38644aedba1so9126005eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795625563; x=1796230363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FmzksWMBsSiVIlu+GaCNOdtvoguP4P/t8qvh5ZCxiSg=;
        b=h8vTj9X9IUa233bmw8+P232XLVvBkFIIL5nUWyRaO2P8yHERHyu5CiepBfULWsEel/
         cSpL0VK0YNgWeB5xf0+dGJHMnsJEOA1eG3lMaoBRxPo7D9DKehGLVoPNCjqKoGfaQNop
         LADYT2rfIxXYtokfHr9OFVe45QkF/9AAuafvhO5zde0Ra3rqwzAz0tQFbN4YAwQ4ocXX
         poiXtQQV4UlA3UfYTvzdg6c3qUiQtDQHJCn6/Upb+oKeV07WoxmSkNyfn0dHUvxeSyJp
         KqtYUIXYZBJyHBrZPgkBKCHM8yd6/f20WPcMZ3eZEFpYkw3w4JuSnwKtabqWEhuXXNsE
         acTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795625563; x=1796230363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FmzksWMBsSiVIlu+GaCNOdtvoguP4P/t8qvh5ZCxiSg=;
        b=qxR3zQ7PMGRVh+5r46xkjLS9Cdbj9vhrs63SOYCjqGDxXeuhBm4LFuwrC0O9PMnisR
         1NoQBqPsxOwRv+R+M9J5ZemRCIUwdZCr8Ei3X7zymRzudBFf8P3Mtdi6tbvA7vRZChlc
         MQog95/u3Z0sDNUEjavFm1cPdLh+wBFeGLIQ0pDym/t9siq75sVGhyDE5jsrmOLutvn1
         D3r1+DoDN439DSfrD/uXa0Ho9fQ9SIZG4uLHFt6UCIX4PcENdc4xlLL210PVNvAGSC4/
         qS0H+Yi+uaAysiBGKx0BfOcYuAMjPEcLh3cjensGL0mu+qycS9dhfmjHFE7z8BAJAPO6
         7MLQ==
X-Forwarded-Encrypted: i=1; AL+hErGwyduEnMRvdpJOVdgReSEUPfgD6mA1a5GsHmoGSiwrskkWTum1kkbOJewrtnts6sz8wFJ+eazjvTarehI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jkMV5Dem2SeDmPHYfRYXdKtiAi7Hh5xMUe8pOySaWhcT7shXg
	TitDjrm4ukesXTODuhgMfVAaOT/zsuKu/DNMQcG7umKZbSUsHzU9r+th
X-Gm-Gg: AZFdTZe5q1v4iuN1pH9MJFTb0+7Q3urIEM++iPsxHeLby4gZ9QOEzKl7Jkx8Yge3/MT
	9FzP18s5qH8ByezU8dpv6ogO/4FmccdXG3wnsiXtI8+g5TKbexjixEVkE7S5xNdmRcU39ntLpSG
	HA6wAVtzyn2XVBcFe8mBRx1JSFz/zcolyWCuF3gmgrDsdxRc8CWTy9yhzCIfXKhz6dmDNX9DjWU
	+/kB99ODtt+2cv47khGJXTs3J7DE3qee/r7OdyhBT3ktl/Uk6slvrn0dBcuXwrQ5deLglsGPrK5
	xycyijy3NoXAzcyqaXggOS5xtfAo4ol9rH6mr6Xg+nI9jNiCvLNVsJnsgseNpMkKjMrB9oLAuzF
	xPFtC16J32sQ1hGxHk21ajZGhETnhgAm03ERdUSzB+WcXHcpXKsDfWWcYyhTjLwMSqjsY3JEknk
	Yv17gh+xVA29j1+euPrI/F6YZBhFnPRl1LTnOJ+LP1fSJaB61uxo+XXj+nVTNmhPTmEOZODEs/u
	Lc0CUaU0n7y+LmMekvvxz3knGNv0LEXLJpeGzEtfBfeQDhhWLwzCp3X0Io+/d0y2Mp3T7KsvLFB
	eF0zNw4TflV/3Ok3HCTqGcA0e8oqREk+XqC0y6oHxIJ1ElEhEyU8yI0=
X-Received: by 2002:a05:693c:65cb:b0:386:b12f:c693 with SMTP id 5a478bee46e88-386b12fcaabmr9329016eec.39.1795625562455;
        Wed, 25 Nov 2026 08:52:42 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm98545358eec.3.2026.11.25.08.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:52:41 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv3 0/4] powerpc: kprobes insn page fixes
Date: Wed, 25 Nov 2026 22:22:29 +0530
Message-Id: <cover.1795625038.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
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

Hi All,

A few fixes that came out of looking at a W+X warning at boot with
KPROBES=y and MODULES=n.

v2 -> v3:
=========
1. Collected RB tags, addressed review comments & suggestions from Christophe
2. Removed PAGE_KERNEL_EXEC in the cleanup patch-4

v2: https://lore.kernel.org/linuxppc-dev/cover.1794572365.git.ritesh.list@gmail.com/

Ritesh Harjani (IBM) (4):
  powerpc/execmem: Don't leave kprobes insn pages W+X when CONFIG_MODULES=n
  powerpc/execmem: Allocate kprobes insn pages from the modules area on book3s/32
  powerpc/ptdump: Show the exec flag of kernel mappings on e500
  powerpc/mm: Drop PAGE_KERNEL_EXEC

 arch/powerpc/include/asm/pgtable.h |  3 ---
 arch/powerpc/mm/mem.c              | 15 +++++++++++----
 arch/powerpc/mm/ptdump/shared.c    |  6 +++---
 3 files changed, 14 insertions(+), 10 deletions(-)

--
2.39.5

