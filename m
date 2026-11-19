Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067357;
	b=Gkgbjx1sRIprRtXe0jj79hi1Q/TXnyzLieccKeMICcXUU4YSl/PHhzlc/aWlv7UoKnLO
	 wuZpD0SFB+71EG9TrJXy7yDzkrznVgHHx+c7O+ZMAPEGweXf948bnsJvH1DIdrvh4eeTI
	 MHQEwXj+5xQVX4YsNsojxYcXXKIpw6TSZI3uFQUtDmV245lrXo7rCpqEjvZNAc5F/rNE0
	 ZzQzeqytVJP8rr1GC0rPMtkYdmvaECWQZP1XPgYfNYlzrOobQLfb+XnJ112YCEmPSnqB9
	 jIRHxT26P+t2+PTEFZoJ2iNWZXY0pxEjH5gS5hS9anaN8yozYhlRLM0aKmHyiw3LxKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g3p7m7TkH/7KFsHJqKL1wxqRtKVLah1m/6dsx1ky3KI=;
	b=wfdU3EKOC8qUCZ9iBT+e8hdCluOO6UpvST3EG+Lkv1J4gUA+kvvKsqXljWZEiDKnCYIN
	 kGvrImCJP4InVZ1uTLgCPFLnCs7bO/GvQsrWHGPZ2K8bExWwCJ0B/zWGoyzQO2s3jaTXs
	 ZMVaG8VfLjm2pTRauYnCETouTvDEVtXorGO0bmW+hkWftxdhbb8k9JLWj3Ax3rEu3y3o1
	 n9VjPc3W+va8Dyovb/12yVyXEybGdVcgOPZukkRdxLL+BKWrbq3Wvladd4eiPRQWAxyz6
	 Vo9bZ2P07Xu9ES8/HRNG8C6D7A17JYtHWoQITcGpUrjEYkyEPBKoY4NmMvFfEf4ysQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LnlqCPWE;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6ED5606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6ED5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LnlqCPWE
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so1068343b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795067356; x=1795672156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3p7m7TkH/7KFsHJqKL1wxqRtKVLah1m/6dsx1ky3KI=;
        b=LnlqCPWEYxuXOZZUgpDQvd/HagWNYsMeoWLs1kuKinCBn8sjGzBL/9nWBAlZQw9yER
         sI3FEOrl9SBOpqrYVU7CzTwEmjA/Ae8ApsuLxcalxBGu9/aVeQ5TWEoKoz7dlownJiyK
         GkmxM1iI992KpFT69dGRBHK/TxCrlJrHXHwa7WRqv6PDswbWeA0qdtLwCpjoZPjrFR19
         vjQeWKaKtt4QMO96tOlw6KyS5vD3EqweqOuLvwBz1Y04S8a4YVDMrbgsmyS4yoSpNPUN
         JtZwKVwiok9tejr8aWv68tKXe8A+bVWT4TnmSu9woqgvWzfmlPXsjAxyJbjebsUBm41R
         yhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067356; x=1795672156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3p7m7TkH/7KFsHJqKL1wxqRtKVLah1m/6dsx1ky3KI=;
        b=AM5DOBKSDWKn/2LNsRHhj0zUc5JPfviYdW0pqxL+TnOxX/tYgCKdVfokO3zeDS0FLa
         nQ6tjHV/cVWVVDgK/6AgYs9mZfz+pKB5CscLm3Y7vrUbJSrJPuVxZBr6Xm1whatO4MZg
         W3siOR7fHLXXh9wT5sDKAtXqyTY7KG0r5nRk2/9k1NsKFXOhMmkisZjz7DdGrOaebTiN
         Lh+ab3kNPFMSU23nWhREnJsZ9zhwSvuwLvrgI5JXVuYxHdI1UsgXYJbC71rQybx4nGUz
         m35vkEyUCCGqqPwKf+tydT9+U3JuGjRrBKEQAbhBKUJQa2cgMyEvR4VBz5lw9Jj38h8o
         flbQ==
X-Forwarded-Encrypted: i=1; AL+hErGbM1BQWTaKDci+KP1Ewcrr9mx6XMhXzBZtnBNcd8F672L+FjIelc/xdz8CUaSrqlaxlyfdJRf60NuNoWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AjmiEDfrEgGMFUFfd1gKUQ+UAyiLOoIBuzrGLYt4zNAd3d4LP
	XETMZym7rGG19kx42diZnHv7doqFIi2rl7o4nB58Ibo5/IPdRpQc6k5W
X-Gm-Gg: AYBFou1v3UDzxEv3cLMFcCZAOAjI73qsm7NDn/Zbs3hyjXskE/u1pH3pHej7i8F9urD
	3uo+6tQSC7VvyjYLSX+lYp4sZq9bvzn6SXHmMYS1XSkzA4hWtBiWdDS5ypS+KKYNPHgwqwA17XP
	mnRQjwOBLzYQqFQgnRe19B4f9PiPlXpwzZAXhVKBuuuVdaLMHkzfmy/0DmZGnWHYlwPnT6jjiC8
	gHZu3dcZy0hva/VzPt+DJI27JzE/eBpGoQlIX3s8JjAvZwHJlgnNzvosj87TTA8qnNsgglFGYO4
	L1TUyoIAFufsjR0FlcXU2EJQmbYCpXvZryNmk1KQc2Dx54y2A3kkdUjKU3kWCQxrPQ8zP2fdNCI
	aPAHtvKLnZc5WQHr5wHbx4dzX+vQneWOTySok9CIdiuSzur6ZmOg2UIB0+FoTKKYjus4gg8YWt2
	sn8EBWF628mceL0Q7qyD7w/AdlXE5f4dwBr5G/OA7Jf295qnHqJDE5CPiyZgGFxqwLfrVnQLhqi
	cu6k60erTJlcAlqex5WzK818lG4X/bkoimgutM0rl80YXIw7C3GZ44t3Wnm6P/Me1pRkR0fUoDe
	15uzXgmNafeM7h7dTggABTNrv9/6k+hGE+HYGlHXGdxjrTP0RpfMaqc=
X-Received: by 2002:a05:6a00:2888:b0:89f:db59:193c with SMTP id d2e1a72fcca58-8c5d2a738f0mr4157796b3a.9.1795067356199;
        Wed, 18 Nov 2026 21:49:16 -0800 (PST)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cac8fe3csm2200984b3a.21.2026.11.18.21.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:49:15 -0800 (PST)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Brian Cain <bcain@kernel.org>
Cc: linux-hexagon@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: hexagon: allmodconfig does not link with LLVM 17 and 18
Date: Thu, 19 Nov 2026 13:49:08 +0800
Message-Id: <20261119054908.2988120-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Hi Brian,

hexagon allmodconfig does not link with LLVM 17 and 18, on mainline
and on stable. Your hexagon-qemu-virt branch has the fix, 09df35bd9d9f
("hexagon: constant-extend head.S calls to out-of-file symbols");
could it go to hexagon-fixes, with Cc: stable?

With CONFIG_WERROR=n, LLVM 17.0.1 (the minimum the kernel supports)
and 18.1.8 fail with:

  ld.lld: error: vmlinux.a(arch/hexagon/kernel/head.o):
  (.init.text+0xd4): relocation R_HEX_B22_PCREL out of range: 2242552
  is not in [-2097152, 2097151]; references '__vmnewmap'

and the same for the second call to __vmnewmap and for the calls to
__vmsetvec and memset. I see it on v7.4-rc1, next-20261113,
hexagon-fixes (0304683b4c43) and v7.3.4; v6.18.63 (LTS) fails with
LLVM 17.0.1 only. With LLVM 19.1.7 to 23.1.3, v7.4-rc1 links.

The calls in stext go from .init.text to .text, across the rest of
.init.text and the per-CPU data. On v7.4-rc1 with LLVM 17.0.1 that is
2.14 MiB; without CONFIG_LOCK_STAT, whose per-CPU data lies in
between, it is 0.76 MiB. ld.lld before 19.1.5 checks R_HEX_B22_PCREL
against 2 MiB instead of 8 MiB, which llvm-project 64e3466fd09e fixed.

09df35bd9d9f does not apply to the trees above: its context has the
"r2 = #VM_TLB_INVALIDATE_TRUE" lines of your series. With its five
changes made by hand:

- allmodconfig links with LLVM 17.0.1 and 18.1.8 on all five trees,
  and allyesconfig of v7.4-rc1 with LLVM 18.1.8, which failed too;
- where v7.4-rc1 linked before (defconfig with LLVM 17.0.1 to 23.1.3,
  allmodconfig with LLVM 19.1.7 to 23.1.3), vmlinux differs only in
  the code of stext, in the address of one local label and in the
  build ID.

Those trees do not boot in QEMU, so I boot-tested your branch
(dc370baa041d, v7.3-rc1 plus 24 patches), with 3 MiB of test-only
padding at the end of head.S to make the extended calls span over
3 MiB: qemu_defconfig built with LLVM 17.0.1 and 23.1.3 boots to a
shell on a buildroot root filesystem under qualcomm/qemu hex-next with
-M virt,hvm=on. I have no hexagon hardware.

Rebased onto hexagon-fixes, 09df35bd9d9f applies to v7.3.4 and
v6.18.63 unchanged; I can send the rebased patch if that is easier.
If it helps:

Tested-by: Tzu-Ching Yang <shingekinocore@gmail.com>

Nathan, once the fix is merged, the ClangBuiltLinux CI could build
hexagon allmodconfig with LLVM 17 and 18 again (disabled in
continuous-integration2 d9d773a8859c).

Thanks,
Tzu-Ching
