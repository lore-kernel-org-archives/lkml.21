Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=176.10.93.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008019;
	b=nv6rx6Clmai46eepcMNKSBpaEsXDHjS8dkNV6+vlSyrRqLh2ZZNcqwDnsvUk1Z5f0Dfg
	 mkxNxZRcfZl3HqZ7ZOfie4dpxui1uEzT0AFi+VJju92oweuCOFbN87kysSrmkFMmhAan4
	 kzLzpJiuxrTVtzOR+CtEXMcuG+HidezRUHCNeA/6v8AKXWihPilIuyrf+Bc2ga76r9M5G
	 Z2NFWfIDs30iRhUljeQCrO5fQETohdsFgzeN9K54f9UzQ1DixsGP1Jf3gP64IJ7O9iU79
	 Z5KajXwePmrNPmwFLl/BU1QBMZjXUK5mxNu5PQQ3I8gct0jA92A6WLyZUTBml0KMVhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008019;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy;
	bh=32cyXCU1sWs+5TgmQguEoU4tTwPL+UvYB/tYlKxvnd8=;
	b=45QkOSy9RQUkPeg4x3z5mV5DcjMWCblzoyMy6VVWLCZxYQIQclx0KZAtWSTiWaw7IcxE
	 qqg0+Zv0az7foQKQh3+8yh2ctHmSeRB7f4KYD3su7rYTuPVAa3xcBGx7RppTtIM08bijq
	 k9V6KxIWPc1nkXcW1YY9mt2Ia+843mS8HnVe6MR+UE+0AcovDPJo8Rh2LqMJb2Z/rki8v
	 YpCdUxUoASsobs7Wfzw6wxsbrow9BqH4HfD4KBPL60Iwy1fsddtndOw4/wnCLDK21PFGs
	 L0xEsWtPH/6NFkNBTSp5Eq4qLflZ1UwmOtjhE8dhmWPF180347WJNyCsmPsTjFQmbjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberprotect.ru;
	spf=pass smtp.mailfrom=cyberprotect.ru;
	dkim=pass header.d=cyberprotect.ru header.i=@cyberprotect.ru header.a=rsa-sha256 header.s=dkim-r header.b=UYOW2Gi3;
	dkim=pass header.d=cyberprotect.ru header.i=@cyberprotect.ru header.a=ed25519-sha256 header.s=dkim header.b="4irY/SdN";
	arc=none smtp.remote-ip=176.10.93.31
Received: from mx2.cyberprotect.ru (mx2.cyberprotect.ru [176.10.93.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8347606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8347606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cyberprotect.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberprotect.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.a=rsa-sha256 header.s=dkim-r header.b=UYOW2Gi3;
	dkim=pass header.d=cyberprotect.ru header.i=@cyberprotect.ru header.a=ed25519-sha256 header.s=dkim header.b=4irY/SdN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim-r; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=32cyXCU1sWs+5TgmQguEoU4tTwPL+UvYB/tYlKxvnd8=; b=UYOW2Gi3CMf/tAuu7+s8KX8Wv9
	py4RP9kUFn7kmDO/JKczP71w9pntQCWbe89qEaIBDBJkOsIPuYBd5k1E1AMi4/tPX6pyn408uCpcQ
	29cBLWrdmkKi/24V8uH44pChKqH+01LNp9AyHibaBFWVZBm32aPfaodYT5Bx8DIHlBhb2x0eGAJaz
	WOBLL4fTvlZCQs8I9YpwBdFqXyuwWHMeHRzzQSFPGq3zQqTMsUW5eAuqoH1DJTA0xqpBmnkMQHFJ/
	Ydt6rk/q6OibKhau3Qs0RUnkF6rSjRAiUbeZnz51GyBKba2xQjDprVqxeNmELECAJg+KJAxEK5QH6
	OuWTRbVw==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=32cyXCU1sWs+5TgmQguEoU4tTwPL+UvYB/tYlKxvnd8=; b=4irY/SdNPUamy7Q3S+eHGD7jMd
	lg6PWy+mOHZ9ZIhEj3bb1IPvu4ivYexv3VkmP2zRAB1hANCfd4SL/qfiBUDg==;
From: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
To: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, Oswald
 Buddenhagen <oswald.buddenhagen@gmx.de>, Mehul Rao <mehulrao@gmail.com>,
	Ji'an Zhou <eilaimemedsnaimel@gmail.com>, Norbert Szetei
	<norbert@doyensec.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, Dmitriy
 Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
Subject: [PATCH v2] ALSA: pcm_oss: reject buffer reconfiguration while the stream is mmapped
Date: Wed, 18 Nov 2026 16:19:45 +0300
Message-ID: <20261118131945.27592-1-Dmitry.Chumachenko@cyberprotect.ru>
X-Mailer: git-send-email 2.49.0
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
Content-Type: text/plain
X-ClientProxiedBy: AIP-EXCH-1.aip.ooo (10.77.28.101) To AIP-EXCH-1.aip.ooo
 (10.77.28.101)

During fuzz testing, the following issue was discovered.                   
                                                                           
WARNING: CPU: 2 PID: 1734 at sound/core/pcm_native.c:3835                  
snd_pcm_mmap_data_fault+0x47f/0x530 sound/core/pcm_native.c:3835           
                                                                           
Modules linked in:                                                         
CPU: 2 PID: 1734 Comm: syz.1.352 Not tainted 6.1.187-syzkaller-00593-g063a81552262 #0
RIP: 0010:snd_pcm_mmap_data_fault+0x47f/0x530 sound/core/pcm_native.c:3835 
                                                                           
Call Trace:                                                                
 <TASK>                                                                    
 __do_fault+0x10d/0x480 mm/memory.c:4280                                   
 do_cow_fault mm/memory.c:4661 [inline]                                    
 do_fault+0xa7a/0x1100 mm/memory.c:4762                                    
 handle_pte_fault mm/memory.c:5031 [inline]                                
 __handle_mm_fault+0xdf3/0x2e40 mm/memory.c:5173                           
 handle_mm_fault+0x2da/0xa60 mm/memory.c:5294                              
 do_user_addr_fault+0x4aa/0x1050 arch/x86/mm/fault.c:1338                  
 handle_page_fault arch/x86/mm/fault.c:1429 [inline]                       
 exc_page_fault+0x98/0x1b0 arch/x86/mm/fault.c:1482                        
 asm_exc_page_fault+0x22/0x30 arch/x86/include/asm/idtentry.h:608

snd_pcm_oss_change_params() frees and reallocates the substream buffer,
and several OSS entry points reach it while the data area may already be
mmapped: snd_pcm_oss_mmap() and the SNDCTL_DSP_GETOSPACE/GETISPACE ioctls
(snd_pcm_oss_get_space()).

For OSS streams snd_pcm_hw_params() skips the mmap_count guard
(!is_oss_stream), so the buffer is torn down under a live mapping. If the
reallocation then fails, the substream is left with runtime->dma_area ==
NULL, and the next page fault on the stale mapping reaches
snd_pcm_mmap_data_fault() with no buffer, hitting the WARN_ON_ONCE().

Reject the reconfiguration in snd_pcm_oss_change_params_locked() when the
stream is already mmapped; this covers all callers (read/write already
bail out earlier on a non-zero mmap_count). The core WARN_ON_ONCE() is
left in place.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
---
v2: Fix the root cause in the OSS layer instead of silencing the core
    warning. v1 dropped the WARN_ON_ONCE() in snd_pcm_mmap_data_fault();
    v2 refuses to reconfigure (and free) the buffer while a data mapping
    is active, which is what left dma_area NULL.
 sound/core/oss/pcm_oss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 2dbc27831eb3..4ce9ecaa6ab1 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -861,6 +861,8 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 
 	if (!runtime->oss.params)
 		return 0;
+	if (atomic_read(&substream->mmap_count))
+		return -EBADFD;
 	sw_params = kzalloc_obj(*sw_params);
 	params = kmalloc_obj(*params);
 	sparams = kmalloc_obj(*sparams);
-- 
2.49.0

