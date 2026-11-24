Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487602;
	b=ci3niG+IfvqqRYhrxzRxJ0vwf2E8iLV26kpyvovnPsG6dD83RM/7ntHRNPj7Ihh1XT4t
	 Bkfc9/z71HKWA3CK/EO4T2QTsRyKgq5obWaHyz0oq8pVGzFzIXKnlcVSn8vmVUuVpJK1J
	 6L/gPvQkkwaJUoXM2qt9B285IJwapqApT2E/wo5nilPmKemeNWaeMdEt7GSy+x1Jxd6FJ
	 DhMjoM647FAMV3s5f59ZxtRtqUnaknzd1rybXKdV6VrPmVfcX1hugU1GTHpW1t1fxc0R1
	 cteFBTi7i2krzx2IkXlHmCX2NEGboYFFVCHG32/ffVF0nicdGv8MiJCsWxO/PZkLCXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rOC9cj6HmV6O00HV57fzzBRSbxDYNsjtxPl7hhF26T4=;
	b=PBpqx8coeyMcaWgkVq3llCnsZiHIzr46wLtCwjZv5zjDQBj55JECE+pMVc3/RB4VH1+P
	 J1/uuMD9cwpQ50fYcK7u2+fOwTCkAHAZ7ySIO3Q28cDELykSwRbQbSUbOqWb9ZeAmB+Y1
	 aS9oF53q+kmzeXkDu8Ms49FKq1wkc86/5PDe4GkKvUoQwOCgIFFve8lUg8p84/kebpwrz
	 rcC34JcMQBkTwwU3QttKkK2zbB18ZAYwUZc7xLbzz6vAOK2fTXTuJw7sMBDE0kxQS5Z/T
	 N3FgjbAxoDjT+A4AL1EHh/Ph1Dm0vPRFP/8Q29tHo8Oo76AgPAd9PldYQ3SMglduavA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WtrWydA6;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148D4606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 148D4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WtrWydA6
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so1299206b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795487601; x=1796092401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOC9cj6HmV6O00HV57fzzBRSbxDYNsjtxPl7hhF26T4=;
        b=WtrWydA6hm9AEyNZJHwUoD6ny2FvIL7TIJIg61vIXw+qDHnXF9TPr/YvC0YkNnzjXl
         XBKyUUdPQ+alZsPXaci1Sku1AngF8sId+6wYA3fs6rO7HPn8FKg2Lnfunbo3ie2vAoJk
         j7fF67xB2/tmzlma22HKZHbx7f4VhLw28cjkbGCJbzMNr3i/WJM/DWrQKUtUr4+PQkyu
         t8BwIetw3d0fGD/wY60/Mmj9fSUSyYMlajhRk7av7M2wNiJRyM+LemlifzfqGuIKx272
         zUw4fKuey3M2vx7MUUaqfTdkrVm6ewcV8HcrJQ63NM0/NJvndZ5I6fVJfLywfp0ql3MW
         ANjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795487601; x=1796092401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rOC9cj6HmV6O00HV57fzzBRSbxDYNsjtxPl7hhF26T4=;
        b=MUr4KmrqJrzdQ8ESUKWQYzPxMqfkNW7RfGG9y0p/l0vL60RHtnvUW6D+iHxgJLteHZ
         7ocfZphjhv2uANeFyoF+AQAZZeU5pdrLgejDx8+KrbHZiSlJ8nxx9XkR4AM5u4FBSpVk
         mLo/YQs3rjyK6dQo8f2ilAaUUMhBNqSbzqTYhqDZpUiiyN5jLdd55QItl6g1hitTbgGw
         JjHZwsSMStvaduA9X3fS2PJNXwIKWZQf372/XsaqaPBAxoAzyBDk1EQfei60DdKPckWI
         Jq3OLyDi5pokrPT32on0t+u17Gp/RoCwumMKJbIR7GqmBAGcVaJ+0wtJgL6xOJvL36K7
         IWhg==
X-Forwarded-Encrypted: i=1; AL+hErFYXvlnzPqAkzy7B6xB/li/rUuUvCVSqy7qIy913cwXy1FoBbg8B4Zril4v++kjbvqmHh8bKNWdTBDhJqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OPlH4QxNDSpL9A+Qlo6OWbqtM25XZ5HL8DnkutlBXkdXH1neP
	f0Olf77d29XXQD373ZFy5DvGQtNpl1iSpsKuw5PouYxXQyoi/cAtNq8b
X-Gm-Gg: AZFdTZfyz/eLWf9tI0SUEhNuI7YkKqx5VCvrzZw/zwc3DZLMIlm/EmBOvyT3V2JaDzN
	+AGQaC6uoXnkHb/E54DoYtPG0s4XPqzZateGtXEA4I2s5F8eiirLIZirSefVbxjVbr42oNdE6dw
	sLFhGd4ZAuc2X1TbeOuZpokYH6ODhdJENgPCXAe9z8OeiVGyB5EscNeoN8yD/bcFxKd+pRgO5ka
	wUM1o9Nclx2vzSAKgtcARQI+xeAilAqg/q/fQkV0B18ivAQ+Hzm56FdpiovbcEY5kQk0aY2Jnda
	7/ih4Jznb9TCinbbkJmvVYuTCGTbwySCd5Nkf/1kSrVAVszY2lJqWX/EQeVJUnHO6qpQqKhzrGE
	2335WHG+5diGCEIV5RAsxjJyq6k/HovRZ91OYPpKQA9U+qNzERPD1qaB0eRzHnF29riptawDyOM
	YNNnW1dU9r7LvX+qRTdRxSncRVJHUHnreRP8az8+r8vMtRbfhC2PFzMqyAnmAK/6MOhO5hedNKB
	t+Uo6gmZBMCqo2qaw82FBhHFohPf7yWVxVrzkMzZuJHBdgH5xJp4xdzIRxWtIf+lb/fo7hFTJJe
	EUURX4WcukXA7Jxot4LfLzvM8YkG3asJFphcDQFWWR5u1boU9DHHBl9e0rxLmMZASi/j1FoGT9t
	ctwDtiS7NWrgyDsn3CiWf+lj0OEsHfNBK9N/UGRaQ
X-Received: by 2002:a05:6a00:198d:b0:8b6:400d:7cc8 with SMTP id d2e1a72fcca58-8c87c672510mr11533751b3a.30.1795487601286;
        Mon, 23 Nov 2026 18:33:21 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c219sm6516772b3a.18.2026.11.23.18.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:33:20 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: reject invalid values in the IEC958 switch put callbacks
Date: Tue, 24 Nov 2026 11:33:15 +0900
Message-ID: <20261124023315.435207-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123170203.243633-1-kapoorarnav43@gmail.com>
References: <20261123170203.243633-1-kapoorarnav43@gmail.com>
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

Hello Arnav,

Tested on a Dell Latitude 9420 (Tiger Lake HDMI). On the three IEC958
Playback Switch controls, 2, -1 and INT_MAX now fail with -EINVAL
instead of reading back as 1, and 0 and 1 still work.

Tested-by: HyeongJun An <sammiee5311@gmail.com>

I ran these with Claude Code (Claude Opus 5.5) on the laptop.

Best regards,
HyeongJun An
