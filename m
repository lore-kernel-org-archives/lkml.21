Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072283;
	b=mBxcT4VcuROhEWO4Jr1KAUz9m2dX+F6jdQ2LIB1Np7/wo+nJLmLtCycV6B2d0DYx/6a9
	 i9241re4NIohh4Eq/ckPHwK8I5VOzg1qbDy+HCkmvnzM6Ipl3tIjELObflCGtd+bcD9g9
	 V0gSj4a1mmiJWBQdRuIAAANnDehdG7Pz1lr6BMZBHdzqw+PYQ2Dbm/N6lLMnBlC9CoDeD
	 c5pldwiDjU95Ca5JlOO7ypH8IDCqB63/HuaRbr5cJKc1YSQ5ChqDDFC2vgqGNoPQMzux2
	 EqqW7mNenTmx1hpQVGxm0EZ6Eb3Zml86eJk35PIebCSieTbVCzKcl76Eci0jQVPh8yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r1BM/wY8vIYJDa3on5D2SKQAyjo6bJ7Kkh/4qdnLUME=;
	b=44yPKTlb59nCrVMqkM5aZWTVyAx/bVCF65dnDZVxPUZvCGwN456rl64hfJfQz4oIbLOK
	 WouowGrBJSfT4+io8dhgkV8BVY113c5jKy5LroDAMpPBk9VJIuq+2lSzroXhQxH8zcaTi
	 FT/pDLCaIp+ILOpfAmRfC4OXmQM4qUTiMePPnyq0zKJ2Jf2Oit6X+Gs9MMcwbATZ94GAd
	 gCCkYh8rJRbugszf0z8GA+sBZ0+p8ks8xRbOMfMCYHJJk0zc0LFx9FpFI5iYnouA5cykR
	 mrNwR0dfK/zWjuZQKx0dBKUPcaC2eDS8VjrXbVjBavgiITVnbdhe3u613sv4VRaMSEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s6rGyArh;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AD9606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07AD9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s6rGyArh
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so26405785e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795072281; x=1795677081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1BM/wY8vIYJDa3on5D2SKQAyjo6bJ7Kkh/4qdnLUME=;
        b=s6rGyArhuSERmUnH60j+FCU+u9jGED8Q7xAtnZgm1V6hoIo4R1ChY6wbnox4ETuCk7
         /cIk8rmhMXzIl/Nyetbo3vmBZQ68waP59u1uivpNP90WucncAw1Q9hSWaRASB9LMV/bX
         zNiuAoI5Mjx/RvKQculPqpqeqWii2f73A1L1ykCMs5RBRhFtTKWemMNQtqKOmPSfzZro
         8InXRKRvbKeSc+kCqVBq7A/wr6oDQk2scwB+ArEzG9DXATWbbxmbC22Ya0UfFJgJsF41
         +Y/iQR4zCJXXfVl4MbzIYYpV0q0z/PjuIkOFFEFcD9VUGDLchCLDR1l3wm9nWjf4A5v2
         sM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072281; x=1795677081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1BM/wY8vIYJDa3on5D2SKQAyjo6bJ7Kkh/4qdnLUME=;
        b=cl23LxJ4px0rMyTG5AvAG4YflB9rhlUDfigJBeqWRaaa1VN06UwUdV3xm5Kpuf+urS
         7FPP321asIJeAp9tjny7P+8blIPmJoReG9GF2nfJysLLqVl++aALLxpmj4u2nsNrPEzn
         m0f9iSXuiNy3kMmH1agBvzCEZpXtGmF/FQGnaB/I9IZSbIbMKYKxPEKYx51n5Oi1x9se
         4tLvy5GWnXCyp6obuKHGVqoLFH7bXD+bZqBBndfv8i2H7gKswZZCuClKxTCsiIyzHY5T
         4tOj6kSDxecQgpqGE7F6OnO3Q8Ndjpsve1PZUJ7JngtyyxEGYPRZswRSPVnGbeDiGhni
         Qpzg==
X-Forwarded-Encrypted: i=1; AL+hErG7xz6ApvkVG4yafXAextgE3Dz05GFk2fByQYDDgEGIFwAopdi6qqbk7Y7LAMv1U9lgIrZC+4m2yqdt4+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KcUWEB7EBheVG0r9JRxwFhYW73E5+HZi3WeldUVrzNShinYye
	SDKZ6y+z6wkyY6OGNzN4nz1S5Y1kGkyiDfC8SRQaNy/00m1m0w5HHKJE
X-Gm-Gg: AYBFou2KCZ1KEow5QpUYLuec08Birn4SDs4SadvpWh+wrjbBC3J1RbiUydyBYnh2o1Y
	Z9k4z3ZPtSo0AOS96xFRzBPZLoPJmf/vH6Ib/P/prnUPbTtpbVjLhWOr0jOWHGaCDhEQyEFznOm
	7D4UmUfrc8Mt2/prLHKcLamc5qRUSm0fI+zjgH52sQfzW2HjeUKP4Mbfer/JE6D1iGwtH73Xtcz
	6htPsL7q2rN29VqsKAKngsdk0DjXxwXbmrKREMP29owsuiE419UIU6TxPTxugoFaGdACjGbzxJi
	9hrdd9DQ66FbhjSW26kylzVA4j7Aruv6F8AfYSf9bI3KYWWWYQi+0UfR2zN4NgPoSjQzrnzlkEx
	DpjpLqQPr1N/GQKhmAx9HbVYrOF0/Ax0D6q5Z++GrKUhKtNBFa0og2a0O3ugic76utogESX1qP3
	hzAjYS01dlUoLM9yi0K3ZtxP1N/V5ARjVko54JtAxCxLisWao6UlRrGsDUBCDNEWfZoteU5P6zi
	DJzltfRzIGEJxqen+oCJNeFfml7ldvXccEgErKdiXh1lhc8vVSkvlDRjbfVRl+qetmQvhJm/LAP
	A+8pEOww8JdvVQ8hzyT8kx/eFojBPFFgvZJigDrP0ChcicATbOiPe43ToY60RvN7DSbOrMO7J4n
	TaAS77rKwEt26uhvlu0wjDjUxRMwNhpufouVMHTlwdVm80pn7sWDDQNH0JyCe1c2bcNou5vIf/4
	2SCEsddyY4zbT9/S51RjBHp6fzrYZC6HWQZDj48nlWzmI8YpuJRhOA
X-Received: by 2002:a05:600c:800c:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4bb7da3d581mr99024035e9.35.1795072281098;
        Wed, 18 Nov 2026 23:11:21 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-0199-55e2-7041-f103.ipv6.o2.cz. [2a00:1028:8388:a84e:199:55e2:7041:f103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2e26csm8676988f8f.4.2026.11.18.23.11.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 23:11:20 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next 0/2] wifi: mt76: mt7925: LED support for USB adapters
Date: Thu, 19 Nov 2026 08:11:18 +0100
Message-ID: <20261119071118.78938-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
References: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
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

Hi Felix,

any comments on this series? Devin tested it on wireless-next and 6.18
with two firmware versions and sent a Tested-by [1]. The series still
applies to your mt76 branch.

Sean, JB, the question from the cover letter about driving GPIO 8 from
the host is still open.

[1] https://lore.kernel.org/linux-wireless/20261108190313.11505-1-lucid_duck@justthetip.ca/

Thanks,
Josef
