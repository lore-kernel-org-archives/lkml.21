Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643904;
	b=YIREEByJbO/3MhrbCeYcCVkg+gkWELKYByYvIm43OpOhHR+SF0bPDdtipxPoZ6SUNVzy
	 VhSAh/8FhL91/7283IY4FC6wD3XdmF9egWBrP0EIEUKS5HKyg/bZYT3fOezenbPOS6P5d
	 b2oM9OM1OcTK7LPm84QEb17X3HiUQYO6BMJVD+Eq7HwE9UfgL0yN7hUIXmvWNkfuy4Ktt
	 GpyD6fviKx+Gm2ddKw7JIbdJiT36iYamqFMiprIT5gljyOezYALRx85HjbkHBfwnah0Pj
	 uekP+/nae4/uMeuuDnEHjEfbAo0bq6htTIhc31bnngzXMIXvQNfWkEPlxfgXadXkdgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wMe/x3b8Hh0Yr4sEQGRRrAWpmDptwcjQuUFjCdKAIsg=;
	b=zEF6gcx+zb9uqmVz9aTDTOCFF/WBaKxwnK/A7JHohWbSIQY9M2BGkHe8jBHoRd8N9qii
	 GwGo1eFN1/RHsVg0QwULQA+UCyDljxkfGEb3YtdQBBxQD1H+nG/m8D0TbVPbOQX3/jVTR
	 KXmnSL3x1xxweKay3gkGIb/OuZ/rEQNqQAqUotWZldEy84wBjV9j0l0b6zogKS6EdxfLA
	 OKjpMf0eWN/9IC901uoTn37PLuWJqy/Pmf9hiTJ0d1gFsFrh3h0WozmojFB1GglRaSel4
	 GmIZFkxL8taH3nsIujifGj91EZfv3BaeWvQ9O+vam2LQDhDoR1ZRepCUvNbDlm4FIKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aK3qOe2P;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BDA606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6BDA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aK3qOe2P
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f037bc348dso51431085ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795643903; x=1796248703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMe/x3b8Hh0Yr4sEQGRRrAWpmDptwcjQuUFjCdKAIsg=;
        b=aK3qOe2PTZY925FSpuYuaunuHVKqarafoiJpBhjV+q6pSYltn6h5YZcXhRO6jsGRdn
         VhEUjRY0awK023iEb4ymzBo1AS002WiX56RownPiuwbztzrJ72rsT1CI2JGgNL10t2zF
         9xmyDRf8I3lr1S9IZddYCMfQY6mHFX6CUG3ngbr7LVBUrijtA4S27Y1I6ZvAVRSumR8y
         no4zFpq5gLBJK8FKFRwCp8f0aecda4hk6WTizgP4Sply8w/vlJV8eABwQ/l/yR88oF+c
         IvzHGoEoW0KXEbDHXWRq+Nt4HnGAAzvkZk+OSYp+tHb2MtuH1fELgCFbsee9V6YHRlzf
         9YUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643903; x=1796248703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wMe/x3b8Hh0Yr4sEQGRRrAWpmDptwcjQuUFjCdKAIsg=;
        b=AHDBJVRWky8u3O2Lpy8rcRWWpnALWOoANHJXSk1+JuNWFI5R5M6VbbYHStn44/sWP2
         ME2Uhsbw1zvPvl4/YBWqPwwG9QK3bW250P1hpK2deYrDCN+2kDHKXSm3JxGeFl/DX1qj
         6ov5NhCH8il55147qJwYkvvF7cn+eQfch4MmWmt0LJO6LFVs3FIBwUn/Uo+8xPJrUIyb
         r+4UQd8CzUhgQ86iS5mV/ys0cy7VQzVUplgy9K1f4/9Tu8Q0wJS+HEIZcSmEAH7CZXxE
         WPI9ybqo3dQZmii0AZyEdP6r70GjUe6RzVX+YLqVEcAc2OX5H2KnFgSMlylNwvQR2hia
         w42A==
X-Forwarded-Encrypted: i=1; AL+hErEwydNk6dnAu6Lxr5Urfrm11ySVGeRhgt9vJlcIH9cF40ebhu9oZ7bzwKqQID1tiNiY0t9hMu6rtAg1hbQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uixDyHiqVRMzQXnWIGSR/BdrMsIhctVEt5cqZK5tsm2FMohch
	kHgc0IN8pt20Y92Q1U85GxYhOErYyLF6DELOqhTJUSCtzD7PxeWPbbiY
X-Gm-Gg: AZFdTZdqrQUwnlzONBIQqOG4O93urgbwWQMt4RDdsZxgfXam3h2zmS7cDtwNLt4pJgU
	c2dB73AVYD/tpNOrwrBqSh5pQBzBZ/pa3IyN9gk3N+TVvFQAXQzLD2JZvEVMukZafZlBkQ70fNn
	0FGa9EykoDwb0zqwSENE8VK9Qit4dTTBURaOhAD90UukBzoHncw6/WeHr+JhOFqnNa9TC2WkIq7
	1LIU+YsObtuIv48aHfEw3Yqvl7SqaSja2TsD+igS9wvortmYsnWEmS4v9hud7Sv6YVslvf9hnUj
	p+1ZN1eEQcNm1ca9kJ2FwancCYHvgdeFPnWwu9le0m8LR5fh5tdFMqRIndg9JzsjmAheMSAIEDw
	ZvYwPs6D4BFlNgVahX1ZudWif4wDXZX/ROUfvUjKh6upTOBHtb5xFlrt4oOek2zaHwc8XhQKpyE
	l0BFvbd/+14mGkvEKDgyMNLpl9hKDr9NsuXuD+2BXvV4u7Pjw3BeuIc0Ts9R8cVTSsOsQcaIGOs
	deYavtQG+eGAyIbCFSDW+DYyznvdZMAGcGcWSIQ+6nUcOp+vYiyRTyAKrYuLkPZLrgoB+HwYXVH
	oX3siWRf8uKFSg5Wo7YH81yz8kuYXrQEO54fe0GB5iri3501tgBFEzj5/R0t+LG4b3idAKiw/Wk
	FguJHzzmvZHRJGQtVRPjcSiZk5vYGfERyU4Q1TkGe1B4=
X-Received: by 2002:a17:902:e5c5:b0:2ed:a96:8a03 with SMTP id d9443c01a7336-2f03f27e77amr175474885ad.55.1795643903239;
        Wed, 25 Nov 2026 13:58:23 -0800 (PST)
Received: from localhost.localdomain (74.82.221.43.16clouds.com. [74.82.221.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm91547365ad.3.2026.11.25.13.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:58:22 -0800 (PST)
From: Nikita Ivannikov <www.nextry@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Chipang Kao <chipang_kao@asus.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Ivannikov <www.nextry@gmail.com>
Subject: [PATCH 2/2] MAINTAINERS: cover all files in drivers/platform/asus/
Date: Thu, 26 Nov 2026 00:54:31 +0300
Message-ID: <20261125215431.120307-3-www.nextry@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125215431.120307-1-www.nextry@gmail.com>
References: <20261125215431.120307-1-www.nextry@gmail.com>
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

Commit ef696e89f836 ("platform/asus: Move ASUS platform drivers out of
drivers/platform/x86") moved the ASUS drivers to drivers/platform/asus/
and updated the ASUS entries, whose patterns only match *.c files.
Before the move, the remaining files (asus-armoury.h, asus-wmi.h,
Kconfig and Makefile) were covered by the drivers/platform/x86/ pattern
of the X86 PLATFORM DRIVERS entry. Now no entry matches them, so
get_maintainer.pl returns only linux-kernel@vger.kernel.org for a
change to asus-armoury.h.

Add the ASUS headers to the ASUS NOTEBOOKS entry and, as the drivers
are still maintained in the pdx86 tree, add the new directory to the
X86 PLATFORM DRIVERS entry.

Fixes: ef696e89f836 ("platform/asus: Move ASUS platform drivers out of drivers/platform/x86")
Signed-off-by: Nikita Ivannikov <www.nextry@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ba7650cb86b0..3ee17232ac0a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4227,6 +4227,7 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 W:	https://asus-linux.org/
 F:	drivers/platform/asus/asus*.c
+F:	drivers/platform/asus/asus*.h
 F:	drivers/platform/asus/eeepc*.c
 
 ASUS TF103C DOCK DRIVER
@@ -30433,6 +30434,7 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 Q:	https://patchwork.kernel.org/project/platform-driver-x86/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
+F:	drivers/platform/asus/
 F:	drivers/platform/olpc/
 F:	drivers/platform/x86/
 F:	include/linux/platform_data/x86/
-- 
2.56.1

