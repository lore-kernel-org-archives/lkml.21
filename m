Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672866;
	b=UK+jQ+4HmrhuJx9P5nss5qAmtu/y5qiHsZOsZWS9n/KXdki6ShRocDZRVATJK5sNK8yO
	 4ZHEOqmTlmEPEtMTohxHycYp0qKBt5thOxWnN18cz4+YaK1iDTgKCdBUGUVN1wO+Ccbbi
	 kvsxQUIm7eBW2XlWNnIjLCaoWMxDwJEZBXXa0GKE3EZQfcvV3KuiuqQCmKtfAS3oFohmr
	 1c/Ft7sex4GBpsPt7VLT+GJDjMVvhpUKRMI0q5vw5k+4GmGrArGJvGaTo3WRq98AritaO
	 Y5cKSe8M2exAl+LgDAKeE5u9RIWQmy0v2FeIFVeoDjjjXwdnV+aBDgz5pQ6GLGIjBvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=noZQpOwfLBmz3TPp2KJmxS4eR0zft1CATjF4Oh8nA1Y=;
	b=g8XnEF3pODLMU4JRM+elkwgkAlb3fS0b8ByCgr2Tw5mb7kh/ChtFQWXYwkmuRoBpiW8R
	 zpM9CTv6JnNRn3F1H+f06a71pE8jldZ8cr+QpzBNB6FskHiLg2HWaBJDJCeeYAD+gTOX2
	 ndNYRPPQXf4hbu4JgCfciZVp6HL4zxxkU06WZl4Pjr546dd0p46lhMyq45SsV9FFgEf9o
	 dmPZf4dqhERQ6Ho7F7gqHxTlD8SB1n1DhRIfWoV+x5Nw5MVSFVGIg50J4wNswkU21/o76
	 Fss6nrwzPboSrfPH0IU5L9cji8aWMYJKlaBTTRPkDcFMeqWWHWZ+vx0DnWffM2YhOuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwKMnaF4;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98070606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98070606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwKMnaF4
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so70047035e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795672864; x=1796277664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=noZQpOwfLBmz3TPp2KJmxS4eR0zft1CATjF4Oh8nA1Y=;
        b=LwKMnaF40gf2NenBXd9HKjJk5NoW1bd0N0ZWMM3TpugQG/lZzB1W6d03tog5bTiLqe
         0Jvfo/vFCCLvRGpI562On+rVz6xBFos3VbGVKjMbgwjA2dm9AX61nRdbebCiA2kOJ1Ek
         LJkKEG6J5pAIyys9SO3fl1X+FbVOdv38Qz98IARCZRsxnDEGCM1iRsa4VBblcseyMJVX
         kJH3BAT9gYcIOmeX+yqyYXFkWpd21tw6Jx7rNhSzRLvlxAhNA4MegBpp8DaLs6RD8waG
         oMKYEpCN2j1XC9VvBj+8DnyA8b2+d19uF9kvyPrV7rv0y6Bg1P3ju/HNvfo4sgBdaS3m
         736g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672864; x=1796277664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=noZQpOwfLBmz3TPp2KJmxS4eR0zft1CATjF4Oh8nA1Y=;
        b=ZejoK6IxjgNhy8sThgkgVMePPHqqlEPRvlFbe9zDTl5dwxXCbbIksUU3L+PnvtZmPv
         iwUJEQy29Ne4P9ZKsCyWFjSPXJUOFSRv6PgcPq5alY5EX+0f/oo6GXj5kqJ/Wr4zMGq3
         co2yUsALJdgnQ4IcSPHx5i4V3LT4alT4DpfFtjJmTTw5nXLPYn2AW94UezI6TB8eExHT
         ODklLbd78QqpEijs82p/H0iVzSEgwI32LKqU153x+g7MR/RGGIRLQKK1TzHQtOBqXHTU
         baqBAKexlEv3Y6qK5g1eQmRUzSHoUpHU8/ZstMnQY+XVSs4bfMz+V5KVuVBXDetRrkX2
         iD/w==
X-Forwarded-Encrypted: i=1; AL+hErGOvm9J2wwhBPObAQv9JEVEyy6/ZmjEbgJPJtVBZJ2h35sV2fOdp4/T4EQdHKw/fa4G+Op42Wkndi8eKRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Rtv8N1AUverNKU4xvtWop/DnUmZfCd987m4Enswzb4dp43dqQ
	8lHuUHxTt3CeLQER6/7iGpb6+lUaqOutzf0VorOrELfPQsJjikWcEHmK
X-Gm-Gg: AZFdTZdPfncdfHvLEMaB8Vblm7LWfKoGLZCAefeFnaCGlFnHtP2qYVAwd7fvH8ZWcYW
	vOnS/Hk67LYfb9WCHfTydSwnk/teZh2iY2wRHg4xOtSOZVcb8VODXAqfJ3tHhDEE2dtc/cAGVAx
	LqX/xCY6qPkqsCAvIxkRtTvQ/qo7jR652tDzN59uvoKf9iEsv7W6vgHSTqw21fiXmCfe9zxId8w
	mZZIrp5ZSFi9F5Im32CbZos0A/mPVuup4snpK4BwoIczWZZL1kf1btBrETym1ch/1jw93g6M/yk
	DsCkUkvpBrdmAU99TR4kLZblGElS8PCNWkpHEffpuolfmFU+ZJF/5V1rhNg55FGP1FdjIGLYjvs
	YhB0fy8V3/DHexZcDztfq47EDM4SdF3Q/m9XlcAginbFf5GGp/jIDy5+AxsxgGZIFzYthKoi/9u
	iO4loD8SHCnGJU+ONO9xyV375ewZdvF922SIUX32E7FtLOxvkVnRfhCkjnDOnikhJ63f/XmhEhr
	qxtUNlnTih5dOi1iC3zRD+4U3En6pmTPC4iuWlP/M22vIGFuYs0qSAhz4mHTWEMrXMA/CjVJSP5
	dOcP6TLtHSIZSFd8bsWEcV0D8A==
X-Received: by 2002:a05:600c:3ba5:b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4bb8880f29bmr451553765e9.10.1795672863649;
        Wed, 25 Nov 2026 22:01:03 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884911e3sm697608555e9.6.2026.11.25.22.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 22:01:03 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: josef@toxicpanda.com
Cc: James.Bottomley@HansenPartnership.com,
	andrew@amutable.com,
	brauner@kernel.org,
	jbingham@gmail.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sergeh@kernel.org,
	taherafahimi@linux.microsoft.com
Subject: Re: [PATCH RFC v3 01/90] Documentation: add a design document for cells
Date: Thu, 26 Nov 2026 09:00:54 +0300
Message-ID: <20261126060054.2554394-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-b4-cells-v3-1-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-1-bc9095937a84@toxicpanda.com>
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

Josef Bacik <josef@toxicpanda.com>:
> +The mount namespace stays owned by the user namespace of the builder.  That is what
> +keeps a task of the cell from mounting anything.

fsmount creates mount in anon namespace. So fsmount is allowed?!

> +not poll readable, ``PIDFD_GET_INFO`` has no exit to report, and its ``fdinfo`` says
> +``Pid: 0`` and not ``-1``.

I don't like this. PID 0 is idle process (swapper). Let it be -1 or -2.


> Nobody has to
> +wait for the task: it is reaped on its own, and the pidfd tells how it ended.

I don't like this. I think task should be normal task, which reaped normally.
If user wants the task to be autoreaped, then let the user set CLONE_AUTOREAP.

Also, you said "pidfd tells how it ended", yet your later example reads status
from cell fd, not from pidfd.

Anyway, I think that we should get exit status the usual way, i. e. waitid
on pidfd with P_PIDFD.

> +   pidfd = pidfd_open(cfd, PIDFD_EMPTY);   /* no task yet, the caller does not fork */
> +
> +   pidfd_configure(pidfd, PIDFD_SET_STRING, "exec", "/usr/sbin/nginx", 0);
> +   pidfd_configure(pidfd, PIDFD_SET_BINARY, "argv", "nginx\0-g\0daemon off;", 21);
> +   pidfd_configure(pidfd, PIDFD_SET_FD, "1", NULL, log_fd);
> +   pidfd_configure(pidfd, PIDFD_SET_FD, "2", NULL, log_fd);
> +   pidfd_configure(pidfd, PIDFD_CMD_START, NULL, NULL, 0);

Does new process indeed start with empty file table? If yes, then also set
fd 0 to /dev/null in this example. Usual userspace programs are not
prepared to fd 0, 1 and 2 to be closed.

(I am human, not LLM.)

(Don't add me to CC for next version.)

-- 
Askar Safin
