Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795161024;
	b=2ZFFde2muS2SEUzeXMmx86rTOSexS70fL3kJxubnwQoee4XZ6VGcdMAL2ifp2xRMEQNi
	 zmxqAVPJkPMJAUCgR7ILrgcqNqfaaK1qA59jtHsmIb2ZhntL1W1d4kp2c0ZtsrvfKVwZ2
	 TjGZEPTm85thOmrItMivN6KuxUDdUAITzfxOJJwTXo/owYRu8DWiM8FHBwxpEGLOj0cFI
	 jIq/JajDDBHncTezbNhCM/bsV1W/+a+iNVtFSg2KQWpALZrpbe8i8h9rLnXNLABNOpOWj
	 1OB+JLQmcgQbRz2WP4lwsumdkCXnz67BeuwVD9YQxpHVwR83dU5nRDe0s/BYAFOo39Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:MIME-Version:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=laooYimjH1tcFM30Wwt+jmq9YRwUKDLkQz3NkQ9Z+jE=;
	b=KpsUQu6CQtthUBTgm6eEtGOFBP7EzYzYewLV0AsmRRb8gvTdp9Kx7qrK77Xxu4EEgLHl
	 nePa4gMwufs1sX8LdxrGFbGHCj0TgacRY5GRm6+JG05iJOrHeIfwIdz5nWO6s/v7uedjD
	 8eaNaptF6E2sW3HgSItLyoeGSplyCykkMTsrz2NmwvwrU6LHXkYvQ2UAYavwNuyo6xFtq
	 dCvxr9UWxFxU3gbu598eygfothN2AR/OdTC746oHNWm/om+dn6OGzrDGb+YpGHXlGQbQ3
	 vFuBJOfcUY2lsTC2QTS0XavsZrXNmUYNAdkrbd7LLptCSfRfjl0WfoligI2zYZL47aQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c46++eFS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BD1606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45BD1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c46++eFS
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5118deebcfso91564066b.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:50:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795161023; cv=none;
        d=google.com; s=arc-20260327;
        b=dTn6RC0/ELByHWlQSMlwqtaQ5i3vez5kzIPF8pO5wJWDzQrMRMFoZ4y1++RAroq7Le
         Xu3fVmbO5SiVSy+j3RnPX3KClw76ZshVuUHyt4C/y8/C0wVwZl57c43TbZCrh84fVryN
         Yy61h77YYHURznLR+HM8jPmULHFy16ycw/p82WIXXXgeVwtcEb1nfhy1uTPf6466IJ42
         USPzOSe8ZphpE3oMBvwMZYg2+WAIAleLVYZl0VOymQyMskQDSRUQCmY79weOpidOUTFy
         nVnU/EwvSvpDWZzEGOiVEtcRMhCRc6z10AaA8Tjdot2mD5hGEv89CJuy4thXjQDfHLhd
         XYFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=laooYimjH1tcFM30Wwt+jmq9YRwUKDLkQz3NkQ9Z+jE=;
        fh=/KCdQultTO12e7sxzLPQogsBMLPEyOGmLS2qeSLV+fo=;
        b=kUpnifMMcQo8255R1PCMael3lHKpErr5/AJ7kS2sXIPBLi4YweXphsaB/Q29kmK4oO
         ILQIImJWCfGh0rh63wV/uyy9tmJle2cVM0Acn97gAsrjmw0bNdJNs9woh2X0SuTQiWe7
         9IocuGWMLzJYdXvKzE8M/iHtYTqxU/O6bvDYUMSFzfcQcutW+OEOrEOFJNMOmfOZVKJs
         ktSv7vz1SttQgzhMOMk/4HQO2eSX/u+RYtNeFPgTlbHn6ZXS7OIn17ilAIY2fyXlx0qM
         BfzO3e1kDuzxrpA14KZBChBfIFO86FvHUIBl1cny7jrSM+QcQ14mGJSMN6YG3q9y1Ka1
         kIsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795161023; x=1795765823; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=laooYimjH1tcFM30Wwt+jmq9YRwUKDLkQz3NkQ9Z+jE=;
        b=c46++eFShCNxAHqiBpKZpuokPRW28Ep99VwYyf+G7W1HCt9hfVChdeg6vwTzj4+nmz
         CqzejixMSdjNFJGeY+FUN3R7T/Utp8M0GikuDQHEbx2/Jsi9PnVqFUpVUeObsX5pdfbj
         6DfH1fI3UbMekpwWs6HbrJWpVqgilmkPPmbvvaknENn/hhylDzPBtG32u12XwVE68Vk5
         Ky3gRrIaK58zHfnu1GKNKfbDXyM8QN4W9AHCO7/NhCL6K13Nf5HRjs6m6Z4LIMbKaU2E
         eLzqZb1XlA1BumeR2blocA6GOHrSii2eChud5XaNqr9FOIVWjbyTa7D6fVypDzFGy1dh
         +7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795161023; x=1795765823;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=laooYimjH1tcFM30Wwt+jmq9YRwUKDLkQz3NkQ9Z+jE=;
        b=E38ao0AsD3cFVmL8ozqkjy9Mn/DapT0fyKpAzUW6Dq4lLnm7hsUiRkTS12xrdvC+vi
         9WLl2QkDnB2KjTxtplg82bcutOEDC0111vWCxbd5Pr0JwIsUw028WM0N56NyyInalr3N
         YSfybqtrBTbphwLdl2XCJ9zgpO5qMY53AmIyRkXVKV6k6LFuP9xYbuQtl6LsaUbo6nIt
         hEREKQhGk2bMShxaT2TozNDOhOfG6gfa7jiQMOAssrIoq2XWWpcUs94VEcmjKHLEWKCc
         V1jqR+SG0X6EJ+2DzAlefSQrkRrOPwUYRez0uAh8548pApYv9ORxRyTn+mu/2neRTqsT
         2syQ==
X-Forwarded-Encrypted: i=1; AL+hErHtJVRAX6E2dM51aJHVQRigagDaPPHuPF5NK5Rkxq9gzSxuP97ce5BaBoaT+kbotvxXiKgvNh/lS9d6+/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zmAtcfoOsmzOcLCbWPlgOqZDmWrpmrPqD7Rbsk5Dqijn97Js5
	zD20wW6O8n4E1cNb2cMeNodpjFi95a4XJzl8aSc+JKRhi4i7B/Zd1grSm6bwikP46Q/Xr5NIrzW
	kCTCG7oRuUDCu1rOJDhiFaMIxPUkm5wA=
X-Gm-Gg: AZFdTZdQMPy+mE7FuYkIqJwI2H8Tw3Gd07rwRtYhCNWNY6xS899DEsS2nyAu6ByTEVE
	eHXFgDlA3hSOU42EwVIMcruUw6GeBRx+jxir+s+5jhnR2ZpzlllW5krCst/WbGLWhM9O6eKLxni
	pM5BbEjg6n91n3I4sH8IXnvalbLGmNqkHnpmVPFaBTgxuPOf6PNMZkqo37HZj1bhYN+sOm3k1UT
	Bm/GVBsJuRcyeMYmCw1lKzeW2gvSW4gMHPFnYFnX1AonwEZePejcrTGOqolrtx6Md6TiLYqtI82
	6BqWfkoYUArKLOj3Yg8LeHmamhGw2VwcLLRaQLr3y5a4soQXRYyK4S94R/EiVONqYtnmulk9QoR
	BZWVfCHWV70+lsrhNCjCWnb7oC0C6hx3bJQ85
X-Received: by 2002:a17:907:6ea8:b0:c51:3bde:bfd0 with SMTP id
 a640c23a62f3a-c513bdec070mr176646966b.47.1795161022587; Thu, 19 Nov 2026
 23:50:22 -0800 (PST)
Received: from 118528743069 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Nov 2026 23:50:21 -0800
From: Christian <servidorjarvis1@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <066e8503-2e25-4666-9f55-f62b7592854e@intel.com>
References: <CAMas6S2z+9-TyTfFTRDM+Qk2rKpRoYAUJSvmMxEwG6eAnQQn-w@mail.gmail.com>
 <066e8503-2e25-4666-9f55-f62b7592854e@intel.com>
Date: Thu, 19 Nov 2026 23:50:21 -0800
X-Gm-Features: Aa3M54q1ScY42KOkGc9AY4ye1HDtxypm5V_5PRhyPxtD_fiZL9q3PrGPi9EoC8Y
Message-ID: <CAMas6S2OpEag7VQAtHaFrho8VF883+EpL9XpO_sTV=ZLpmDJsA@mail.gmail.com>
Subject: Re: [PATCH 0/2] x86/mm/pat: HIGHMEM pages in set_pages_array_*()
To: dave.hansen@intel.com
Cc: dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, x86@kernel.org, 
	hpa@zytor.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 11/19/26 11:45, Dave Hansen wrote:
> Reproduce upstream and we'll talk.

vgem does it. It keeps its buffers in shmem pages (GFP_HIGHUSER) and sets
map_wc, so on x86 mmap() reaches set_pages_array_wc() through
drm_gem_shmem_get_pages_locked(). On i386 without PAE, once RAM is above
lowmem, those pages are HIGHMEM.

Reproduce with v7.4-rc3:

  make i386_defconfig
  scripts/config -e HIGHMEM4G -e DRM_VGEM -e DEBUG_FS -e PTDUMP_DEBUGFS
  make -j$(nproc)   # no PAE: i386_defconfig is 32-bit only
  qemu-system-i386 -cpu n270 -m 2G -smp 2 -kernel arch/x86/boot/bzImage \
      -initrd <initramfs with the program below as /init> \
      -append console=ttyS0

(-m 512M stays below lowmem and is the control run; -cpu n270 has PAT,
but -cpu qemu32 oopses the same way without it.)

  BUG: kernel NULL pointer dereference, address: 00000000
  EIP: __cpa_process_fault+0x336/0x360
  Call Trace:
   __change_page_attr_set_clr+0x782/0xa10
   change_page_attr_set_clr+0xdc/0x540
   _set_pages_array+0xb2/0x160
   set_pages_array_wc+0xd/0x10
   drm_gem_shmem_get_pages_locked+0x86/0xe0
   drm_gem_shmem_mmap+0x97/0x130
   drm_gem_shmem_object_mmap+0x8/0x10
   drm_gem_mmap_obj+0x5a/0x180
   drm_gem_mmap+0x32/0xa0
   __mmap_region+0x930/0x1120
   ...

A second buffer's mmap() then never returns: the CPA lock is still held.

With patch 1 alone both buffers map, but the user mapping is write-back
(page_tables/current_kernel, CONFIG_PTDUMP_DEBUGFS):

  0xb6fdc000-0xb7fdc000   16M USR RW            x  pte

With -m 512M (no HIGHMEM) and with both patches it is write-combined:

  0xb6f76000-0xb7f76000   16M USR RW PWT        x  pte

The program:

// gcc -m32 -static -I/usr/include/libdrm vgem_highmem.c
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/mount.h>
#include <unistd.h>
#include <drm/drm.h>
#include <drm/drm_mode.h>

int main(void)
{
	struct drm_mode_create_dumb c = { .width = 1024, .height = 4096, .bpp = 32 };
	struct drm_mode_map_dumb m = { 0 };
	char path[32], name[16];
	unsigned int *p;
	int fd = -1;

	mount("devtmpfs", "/dev", "devtmpfs", 0, NULL);	/* when run as /init */
	for (int i = 0; i < 8 && fd < 0; i++) {
		struct drm_version v = { .name = name, .name_len = sizeof(name) - 1 };

		snprintf(path, sizeof(path), "/dev/dri/card%d", i);
		fd = open(path, O_RDWR);
		memset(name, 0, sizeof(name));
		if (fd >= 0 && (ioctl(fd, DRM_IOCTL_VERSION, &v) || strcmp(name, "vgem"))) {
			close(fd);
			fd = -1;
		}
	}
	if (fd < 0 || ioctl(fd, DRM_IOCTL_MODE_CREATE_DUMB, &c))
		return perror("vgem"), 1;
	m.handle = c.handle;
	if (ioctl(fd, DRM_IOCTL_MODE_MAP_DUMB, &m))
		return perror("MAP_DUMB"), 1;

	p = mmap(NULL, c.size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, m.offset);
	if (p == MAP_FAILED)
		return perror("mmap"), 1;
	p[0] = 1;
	printf("mapped %llu bytes at %p\n", (unsigned long long)c.size, (void *)p);
	pause();
	return 0;
}

I can send a v2 with this in the changelogs, and with hpa and
linux-kernel on Cc, which I left out the first time.

Christian
