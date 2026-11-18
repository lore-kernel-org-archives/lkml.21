Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794961984;
	b=Ofk7YqYo1k8im2pniLP5OMPFUTeU2pMahChOCsS495CKB8Tq8zAD3ShY/75vkcQFW2Xn
	 1K7cOAvGt8KmxtpIB5ANX+7Nt1lFNdxRopC736hG0r/P06KDWidMsBFFa8dFLVYHpQIc5
	 i/MJ+/TW33xl0qbVfhqQiCn1Gvv21MV5qSJPgZaieCoORuCU5TI/QXu/lL1nvqeAEnJER
	 Bj6R4C4xo2rdnqV9cM4o4RN5EaahAor83so/xL5cEtjqIfxPQvNM52EVhX2eGLbI+Bb0I
	 3ueYGXWPRXPG8yo6C+ylsFqd6Ba6fAGXzU8yRxEWjFrORDopnV0OXfjSowh4IaijmhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794961984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gjGQXw/70DbXqpjUFfZeDZh2w0sbpZHOaCdTp2IlGvk=;
	b=H+UF56MHvzQ/LAZa99qPUTnm5cFMiOpqaJ77PMI/MbY4SFCPqZDYK+dhZ3y3mugog2o/
	 El29PdtuhLwrmR9ysTi0Uvi0Z7ZAiJ++Op/MwwyJASgJ1K6m0m3dJvvPaz9M9q9NynM+R
	 CiX2RVuSQJQc947Q3tvXepsEzohSu5zz4+Hq5EdMk7zX8hFtEy5Odd50yoGXsF+18uIRq
	 k8m4c+gbzffOkvnYwVuJTtafhf8GkaKLPLVhSXdhVvkQ5mcp0Kqfuxwh/3Ajl32b8DMK6
	 9glwoxX1TzOJhoYG0C5gpu6pObexgqGmxl71/7II5BqCx5sC7lbjZbvCaOFX3H2sn4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yBYHROdA;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E68606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00E68606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yBYHROdA
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-70059e4dab6so258720eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961983; x=1795566783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gjGQXw/70DbXqpjUFfZeDZh2w0sbpZHOaCdTp2IlGvk=;
        b=yBYHROdA5yxM+zOO0I5PPRFs+Aa/f417+NndZoLS8vVqf9QiD9JYsEW96INWoEPPHM
         q3FXykjJiSrgC2Wbg3zqcCPN/2wBZ63EXOzPqdg9VxpXb0OrwFHTU4MW/veMVcIy7pPe
         3XxJ5YE3gtJn3hKpfc6c+Sjdp0no9Y0i+iND5TEJayZWLJOvn9gqe7BgVPOpN5IhWwYV
         vSX+iBwZjLA6G4aTjVdhXfdqfOkPrCr7fP9osC/xqVQhoPlXVIbGF5Jb2tlWsERnpeIl
         MO4Ghvt4ibd4jjUSKCRsJWNeMN0WrKdXvwgG96zoK8OxovB9izrc8LpAv1p3yj1oJFRg
         ew7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961983; x=1795566783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjGQXw/70DbXqpjUFfZeDZh2w0sbpZHOaCdTp2IlGvk=;
        b=0NH15sSdGM8WISR4ytZaASMHl8vQ9gxcjtjA6nJU/6jWkGsCK1O89a4Ny9WHPDyCuy
         qdDYg0Kd60xj2Wktdgz7fZiqcXASJX0UTnAFAA4vgZ55CAncNZi7WhErb9LVpupS/b8/
         oR0hXUvcSgmfeM7iyFXYPuBIPNodfvNZKlCAWh0V3BgH+72FdDihf2aak7Sz149KpXp9
         GlSngDQ2xX3CwlC7NmCLA7oDt/sFwKBGJieY7Ryz6xWtXkJKLeLui/0Launw4vc3p/LW
         HzAmOA/1Mn1SBkaYM5U+FDvLa73wdWmMqIZMbtVSO/fUm/EG1Z2WppV6HyvNpHB9dXzk
         9fhw==
X-Forwarded-Encrypted: i=1; AL+hErGtK+JpH0Fyl0YbmRZqsqETscbB9EB45Qwdy9U+KRdUfLD4901Miny8D+g9+9zkN2TgIoLYVbODimBTQts=@vger.kernel.org
X-Gm-Message-State: APuU4Z+08C42zgbFOU+IRmpvIDoESqDzJeOfSmqHHJyUJT2ufryq0zJj
	aCvHh6hy9aZrOHOMH2WBy9Q9T6ANwqjeosxTLXLPZlLyagqDUU6CZRQKPwvimjox
X-Gm-Gg: AYBFou2k05wCZKFLYtigF2hIloYZ6Zmv/CNfC6e3JkXvVpBPbkx7q/jBt1WnA0+Rfsg
	cb9HpzFw7c7AtXzNpl1INWtjbAXR7ssoJN1uYVGF2Z4DEeUwKPpDyShfVbjxzUYrGKWayn9adPQ
	fF90qaQxm4ABXSGnHjQ1ULFFHLa2KNpxShVN2dpBcu5iPJxlUOIBGsx8e0Qfl2pkg3X7RnThBJy
	mV3LjYMNqDyw05lfja3kTKWYPVVC1mlojwYlqukWpSQij81PaURsqV7KGGHOht/2u1BGaXvuSLM
	wc14lqRqu8lPBMLfjloZ2l/TcIe4X/w0ZL9XUfCjA2hupet+l4UBlJS9FK9gretyHLcfTWkUkcg
	S2CmzeKtzs7do6DYsqMjRQvHgSjwk3RE/NqVjIiVpBRyXCrvYbWj29hLlkCYCc7146HqoqkosQK
	2yttgQ+q4B4Hj5K5L1dYe0K9lNDvtsXnEmzS8TYhrt1pLCiZSMJHikqE2FWIXNfMkhAY7kou/Hd
	dKQTHpjCtiQ75fvM5ZLA5/JpwTzse1jcmw89uyj+vEZuFHAL+s+ww7eF/uwWLGYbTtHl/PdseXw
	cbod/QV0PDzB+mwF4qP/ScsC2YBYv7h5RCFEZNX+XLjIt3TZqrhnzD1nCQAPvtROvvITc7W/wBY
	3VexCKoCmdQTREGfRmhHFeuemvp7w1d5wM484Og==
X-Received: by 2002:a05:6820:178f:b0:6fd:4277:16e7 with SMTP id 006d021491bc7-71b18476f7emr825396eaf.23.1794961982890;
        Tue, 17 Nov 2026 16:33:02 -0800 (PST)
Received: from FKXX2DL94F.bytedance.net ([72.29.204.230])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b19229f3csm736942eaf.1.2026.11.17.16.33.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 16:33:02 -0800 (PST)
From: Yifan Feng <evanfengff@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifan Feng <evanfengff@gmail.com>
Subject: [PATCH] tracing/fprobe: Do not let KASAN check the $stackN read
Date: Tue, 17 Nov 2026 16:32:05 -0800
Message-Id: <20261118003205.59804-1-evanfengff@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
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

ftrace_regs_get_kernel_stack_nth() reads the Nth entry of the kernel
stack for the $stackN argument of fprobe and tracepoint probe events.
That entry can be in the redzone of another stack frame, so with
CONFIG_KASAN_STACK every hit of such an event is reported:

  # echo 'f:fp_read vfs_read $stack10' >> dynamic_events
  # echo 1 > events/fprobes/fp_read/enable
  BUG: KASAN: stack-out-of-bounds in process_fetch_insn+0xac9/0xcb0

Use READ_ONCE_NOCHECK(), as arm64 does in regs_get_kernel_stack_nth()
for kprobe events.

Fixes: 0566cefe73b9 ("tracing/fprobe: Enable fprobe events with CONFIG_DYNAMIC_FTRACE_WITH_ARGS")
Signed-off-by: Yifan Feng <evanfengff@gmail.com>
---
Tested on v7.4-rc3 in QEMU with KASAN: 6 reports before, 0 after.
Found and written with the help of an AI coding assistant.

 include/linux/ftrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 1c2056a1a68b..bdb6ee6bc3b9 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -270,7 +270,7 @@ ftrace_regs_get_kernel_stack_nth(struct ftrace_regs *fregs, unsigned int nth)
 	stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
 	if (((unsigned long)(stackp + nth) & ~(THREAD_SIZE - 1)) ==
 	    ((unsigned long)stackp & ~(THREAD_SIZE - 1)))
-		return *(stackp + nth);
+		return READ_ONCE_NOCHECK(*(stackp + nth));
 
 	return 0;
 }

base-commit: 63fdb511c27afcebce797e3db580b3534ddfa639
-- 
2.39.3 (Apple Git-146)

