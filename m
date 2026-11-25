Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795608266;
	b=chal3gx2wEelna7QrEHmKguEqdD+ny2BLJEYExAO6q4wt2ftcs8Wn5jsSuDJToG9z4VE
	 AnLK3apLOuGCpv/7iicFtG62G2sB9zoiuYSQK4z+lLhVIntkDHEmVQrNmmPLVuIn3pPUo
	 t+lFC2aP3Aash2E3M7GB1las4EakeOtWY9YxGsvOLZJIpkMM+epBGePvZDmHaGL9hEwed
	 Ivdemjolc/gnSwVBAPIir4FIjwlGTuIbZme1NoyJtNQcCZzHnPfTTIJluF1IFG31U5RA2
	 xyiYJR/Ic9bnZ7T6A3/uPbFaL2p6RsIZl/eciMtQ/2LM2gwiSgZx2SM0FsiuSIA1Wwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=z+UkoMvvEaVTNil18OTBJI75hEZ+FMKT77tUTvdlmZY=;
	b=2Hzv6XXqV45jv6OkTXgDCSHp7fNWnulsrY/pEpoaB7tO2Z2Ok4x3roj8On37EOA/hfGn
	 3uXloVI8U+JumGhud2N9/7aRujPBWrM/XfiCVPJw0kKBUs23X1dDyecCIrmGjxfGAf5g8
	 imu6l4oxkf2Cax3wqsARatdbtzCG+w+CU/oU7PQpFgFTThY/zJ5o9VEGCh4BLGTCa9YXG
	 JuvYJALr8D0ovtiAZXaKXjh5LDGdl4G/+OrimB816zYxNl+9hLYVdY/1lQ3nm6E/arAny
	 90A7BbhCUfDUhK2mJU6tvlInjhiN2sRPv1v1YUyrTvj7jo9K1LnNVWWk7hpFVR2XQkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v/lRLI/6";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973B1606A339
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 973B1606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v/lRLI/6
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4c685c751so49666727b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:04:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795608264; cv=none;
        d=google.com; s=arc-20260327;
        b=nkd9rOQDb0bq9dRMfiE2/PQ+KnhVufNkVF6TXnOfALyBhijNnXdTqZJ8Yrc0fT253A
         XyxntHxV/7PVmtl+wC2+zXpiiHUBBXeolB9Ci034yiCz3LRcdfVtTfA9d7y3Y+oyd7cI
         UCnQK8e84gH5TjsOf9vRIJAuaH/+vV682gaVor6A56cStSGmt1TtjDX0lVqFWnxcngNk
         UdGGx/VX2/QfMijB9oLZCd9cuscn81OJ4Ho4SscMI0G5blFo6Ek8bkbg1WL+c08rBaI7
         B/fUOS3gl3xc/JSRYMRLuI+X7654BG3MBrMBhqTl86+1Kknclyj/uVwmYBF4cEcQtBqG
         e2mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=z+UkoMvvEaVTNil18OTBJI75hEZ+FMKT77tUTvdlmZY=;
        fh=9SHnZm3+nm5FGTCSaDlWDyV8Bg27khSbKo+zIZFaFG0=;
        b=RvhorFxlLCYTA4hIo6svcg9wHxNNrlgGJAWrww2VJZUSS2f42zLY+6YkGFNOhEy541
         kTtZZHAOoOg7xoanVqpN4RTTZc4/YykrGWOHtHgBrBXql+BkNjzhRfD5iNHeXIcs0VnP
         oyLtaWpTN++tJFhgBeVDiYpiuxqqXZMMCOSHdKPNMfr2Q9gd2j+QHx1ML5JahLkxPoKu
         r73U2OYJMp9zDckS0hHHMJ1NghXSrtzRHGmoj0qy6B2YiA46q1BSb2b6eafKyEFI1++k
         Exyg5FfK3NC5eC0Y7xZ2Uzwgg1wvsWHb5r451LiRDc3E6ngCM+gIX7VG2KXO9cD2th64
         HNnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608264; x=1796213064; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z+UkoMvvEaVTNil18OTBJI75hEZ+FMKT77tUTvdlmZY=;
        b=v/lRLI/6A8OQzRxCu/iTwg1iJgBq/xMj1Kawkk6QIgnAh6avbVuDxItK2xWpSTX6Ym
         RW9+u8YoSgQtE0VKjwoo6jIevKDdLE67PlKdX+/eLOlh1FEzINMW1YQcJPSEjRwmNYoQ
         DzXfPRO2b/F6SIsY1G+z57UPAOx2nm407QQagbJ0CbiD+WEhdOEnR9FHRmBuXqSHie3R
         c92vMDkgOIBj0PArFc6b/i5dXsl05Ksfsx6an6qMFcIxg4ft7L8+3QB9jFlZgxo5rJh2
         AyTPIRtdglgfvcJNDtWk7wXreSuWSPtzKCPFgNiqL6s7CTwyZX3lTxnlIfd2N/gmNLxZ
         6Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608264; x=1796213064;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z+UkoMvvEaVTNil18OTBJI75hEZ+FMKT77tUTvdlmZY=;
        b=isSlltXWEAA8ctXkTiq4tMt1uYrTfCYy6aC068GLUC6FAv8lYk6GqML0dzGH27KCJM
         l6Wco/cXk7db6iCoF5osE3sWAhTYh76r9iHzNBB3BxI9rwq+wdCUbn7mBpeF8baP3fmZ
         fj/OsZXUj3uwHDUreYLQNrUHZFT9okhii38QQ66Hg/QJ+dvD4LvctBIGL6pBVpmMdOZW
         CC/m7WU7vna9wD7UGrZHFnZfB8OKQQXSYQKjGrQcNLTGvpMyacwHWEbolf2G7h8QABo0
         ilzyy9XbAZ56IzAABbxc4+qLUkt0EWZBiMfeS06evY2vyxer0E2nR7USz9hCQIj1oSXQ
         cINg==
X-Forwarded-Encrypted: i=1; AL+hErFeMS74e3Mm+k3ZZaNp4f6u2mI6HEE/ev1Qodu2nUoeRPPV00htGy/J/FPeDAopIUHE1Vo0CALkRCjvg50=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZqLNHiBq4ZKOOo0Gmp+Z31jE1Kx5ChpCGjeQWIrDP2BRMl3wV
	se0edes5CL3DT8u9ELi+7Acl42hUqrakELZbu432iGJXsajz2y0SDRkOgj8ZM92yuc6uCyUcif9
	iXnSVXllyCOXR/Es5njNq9RqeHxw49qCzzV1J
X-Gm-Gg: AZFdTZcpuNme9Sa0K3a+5Rn3iXZgGnSbVeXXZ5biD9SvF42l5GRh8J9T0dJKnk7cgZc
	WN6RDFUZvMSu/5NOQssAkOb/PtuvFy0U61QUogH2x4VlY/oVjhv06+xH2EoQTajy6iyD6yOcmlP
	od/yEbOAP5TnQNDyJLFdKHiNQFtoo/pEjnVeKxEewI9u2FeNzNCs6mr588deE0u3ScyjgqnANZc
	vZlF14VLebN5Vg5Anx6Yuf50HYRUbF/9CQOS4XFvQ1YWKSySAZNRBC5aqRIWHqwu3hs/b0e3B0W
	ZycXlWr8as5hRq1Xv8ZxLf8UtVNxkMFMUf2jtETby3IufZ5N6hiAPQ4S/xdpd4eGEO2kumnS5H9
	wTsDmPpwOWTQLmK/+OZSpZmVZugN6/PZBe7vLQxKa1z6YxfxhHXcGbYHS/yRV4LqiIpWm/ejyE3
	SeVajoEy7HnWWPvwdX5gV5CHklZrovXkPuLeuZCLfS
X-Received: by 2002:a05:690c:b19:b0:8b3:47ec:b20a with SMTP id
 00721157ae682-8b520475e0cmr66201927b3.43.1795608264600; Wed, 25 Nov 2026
 04:04:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Marcel Moosbrugger <marcelmoosbrugger@gmail.com>
Date: Wed, 25 Nov 2026 13:04:13 +0100
X-Gm-Features: Aa3M54r2ba5mZUdoWmYri7uZbuEx-lFWMUQY_KR4UYOrncn3hD6_3rK1rzheKEQ
Message-ID: <CABtUotOE+6AJpp9ewj3rDWRM=MdHOtcvqAhVmaZ+QAbZK4fSRg@mail.gmail.com>
Subject: [BUG] intel_idle: Arrow Lake-H hard freezes, stopped by max_cstate=1
 but not =2
To: "Rafael J. Wysocki" <rafael@kernel.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: Len Brown <lenb@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

Two Arrow Lake-H laptops (06-c5-02) from different vendors freeze hard;
only the power button recovers them. On both, intel_idle.max_cstate=1
stops it and =2 does not. Crashlogs, oopses, dmesg and config are in
https://bugzilla.kernel.org/show_bug.cgi?id=221923. I am mailing because
the evidence now points at C6.

                 ASUS GU605CW (285H)          ThinkPad E14 Gen 7 (255H)
  no cap         5 freezes in 34 h * (7.2.8)  9 freezes in about 51 h
  max_cstate=2   froze after 79 h (7.1.9)     froze after 63 s
  max_cstate=1   0 in 510 h awake             0 in 671 h uptime,
                 (281 h of it *)              s2idle included

  * on a Thunderbolt dock, where the ASUS freezes most. The ThinkPad
    numbers are its owner's (comments 9 and 11 in the bug).

intel_idle has no table for INTEL_ARROWLAKE_H, so both use _CST: C1_ACPI
(MWAIT 0x00), C2_ACPI (0x21, a C6 substate) and C3_ACPI. =2 removes only
C3_ACPI. So the freeze needs C6, or a package state reached through it,
but not the deepest state. The freezes that left a CPU-side trace died on
idle exit: corrupted per-CPU data on the ASUS (all 16 CPUs within 65 ms),
a misread instruction byte and a misread exception target on the ThinkPad.

Specification update 834774 rev 025 lists ARL036 ("Unpredictable System
Behavior May Occur When C6 or Deeper Sleep States Are Used") and ARL037
("A Core May Hang When Entering or Exiting C6 or Deeper Sleep States").
Both are Fixed for H, seen by Intel only in synthetic tests, and may have
a BIOS workaround. Both laptops froze on microcode 0x122, the latest.

1. Are we hitting one of these? Which component and version has the fix,
   so that owners can check their BIOS?

2. If firmware with the fix is not out yet, would a quirk be acceptable,
   like the Skylake-H one for C8/C9 (d70e28f57e14)? A narrower one than
   all of C6 would be better. I can test C6 off on E-cores or P-cores
   only, or any patch. On the dock a few days give an answer. The ThinkPad
   owner offered to test too.

Caveats: no reproducer, only rates, and no known good kernel. Neither
kernel is vanilla: the ASUS runs Omarchy's (Arch) 7.2.15 with nvidia-open,
the ThinkPad Ubuntu 7.0 with VirtualBox and no NVIDIA GPU. During the =1
run I also moved from 7.2.8 and from BIOS 311 to 314, and kept the i915
render GT out of RC6. Before any of that, the cap alone gave 116 h awake
without a freeze.

A correction: in September I wrote to platform-driver-x86 that the
intel_idle angle was refuted [1]. That rested on =2 only and was wrong.

Thanks,
Marcel Moosbrugger

[1] https://www.spinics.net/lists/platform-driver-x86/msg65594.html
