Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663716;
	b=SWyNvD2N4mxCW0yyzWLLOYx5wzu4TnObmrLmIIme1vFGalh73iLE50KGiiEycz+eiwhq
	 jBzBaSLV/ENVEFpU/AG1uS8L+opks7SpG2QVIqSuK+tEiXiEDHIkgKhh8n5maFEirSqsj
	 xuXKkN4kH0iNh8RqtDxgUL3NkZylzUQmcWDfsuat/oA6/N6ajOyWFeEd45dvzhS5M8eCf
	 5mf0/rkrbC7hVdGNSS8Zo1rcsMWei5zgb+xitlp83jQ3Y1+upPCuPXFS/s8AD0qM/dlIS
	 w90SGJpIkqGeRYHLuz3tRd3phUxV5J/hzLcyUKyzcvPL74jsa/CnsfMPVIFqeaPObUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HqIBIkYmDIeS5rS19uDkZorN+oiTXB7kdAGh3sJeepU=;
	b=3MJKn50vLmySe16uKwy7prOIV78b6Us8ztc7inPu5xW2RQkKBFL5/H2fF9coyGGRQRAO
	 Pqws4zQLLcYc/1z0WIq0qXuThsttR4VTXmNRdTYNM5pPqDddbc8nRJnuRwJ0jzJhDREUD
	 TP3N7Vrs/oRVBOMEmTwYto+5Lgrw2bXoIUCG5FrPXf9+HdjfiLXxKWrO2Q93JEFX/RAnz
	 sBBGkk9vmNk/rkYafYr/XNE5J7ihfvpE3OtL1gWtzzU6j69+87ZWlWmzBwBj+7PRAbWcw
	 9nl7UG1RStiZlK/KqK6CwaQSMUazPMKIZUEptPVnROOkZvWMd5rMqD8ky2Chvr/GoWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=kiYfm6Xj;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E47606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56E47606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=kiYfm6Xj
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-92123971d1bso49940466d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1795663710; x=1796268510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqIBIkYmDIeS5rS19uDkZorN+oiTXB7kdAGh3sJeepU=;
        b=kiYfm6XjKY16umLSzCMx9xtkmZ6TgMTLPuigyDJSnxMHXRyT5aJnlv+ZiYqIq/b64g
         QaVsAKPDujWPMBaZtJXoEJWyTbIe0Je+xB/kVlbVf1Lk221ap+ngxBGXvH7jDWq5KqSc
         kzM6dIwbzHfRAQMuYe/pu155R3nm7ArfhYdqfgLzk+4ugKaOW61VPKERVFuZ1IrPxEPG
         IEft8W99MCOb8zFwLdWH0z+G33Pwl8+QnHKF8C9gIviY3XzX/akGPwrpPYuai4OdIy8o
         3/DsW0URM/aTVvVwRYeAa0MhWFJXGgt3v+2jtiLZrqwbbnixtQlxMBmk7yNI+b3mDkSN
         2tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795663710; x=1796268510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HqIBIkYmDIeS5rS19uDkZorN+oiTXB7kdAGh3sJeepU=;
        b=TsYXb75wDdCas1Txynf0tP+W6dxU8vyN6qU3RYHYl5+bFiedVu8GHq0IbMR9njijyX
         AryX5TdAcpNUFZC1gv2UjaR+Qrzmc5s8bqrnx3+vmXvnbtklK+6p6H9biv5otV7MrjfR
         YYdtBGTw3Ayh9JE28QlkxFB0Y1CkeER41LGe4Z5XlEFi0tjijKyxh/V7EFSBIuTpOluQ
         uO1E9ktPuGqqROKUmNLzVOgFWpZ69IA8Blq/3woSWIikaifCH4gOZA8zJGBVAkYK3u/9
         z171Nj+LX/Ce2hOrpRIf5OHX1wF8621Toey0vYCutu1CVEeJnauOnlDb7qzzWM+qYAyN
         rk7A==
X-Forwarded-Encrypted: i=1; AL+hErEpa3j4FWs+STMcAMSbG6L3udp5Crm5HFOm/tstvy1o/Yl5Vpn1ThovKY/vGTSqhwVsFf+qfQDjCrmujGE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Mr1C9IeXj7q5+TN8UAT4/qNR5dNPrqCQRnvz/fgD5+UMFHhM9
	NqG6vP/O9ZceTbpp5ggIidONQx0VsQ7BpzbjMlBSL3HEzEd9dd6pmtVJmXr3vsN9pw==
X-Gm-Gg: AZFdTZccPRiPz2+6UmE5ZSwIRyXsOSfWnvsGcH5jQgij/KKtHccBvnicVeh8rnD24r+
	vvyOxRFrb0r+nCv2b7o2lr9u8DVYmszJT4iVuEhfHfBPW8RpGE19+DwnrXQ16t98FVDCzsGQCke
	a33S3hCUO0MHb5oi7nuzKcUkrfAkuFfJagvwQQP0YhNy5MQWCMsuwTy8pZomN8l2+vy4oiaVqc/
	E01grhYMhuhsx6cRWF0dJLRrRJsaOIqN3raWKeURDmwMx4aMWNK1Xph32GJwbF2cqI7jDWYyZOO
	40UgLjdK+4XTQ90uBBmREDTa4kr7xQVZlQiDUjWIQHzXoV+QMeTfFwgnftdtQzbZC7yGfJT2DRb
	cfdEm1ZO1JqNvJzojmLpt9PpdcevtisKIQEiMzYQ50FwBnULDC2VhDGUyYX8SJhToPj3hO6GSka
	DrJ01YWhVuUDfEvteWM4mTB7+WrniEkznbJgF+GluGL30TcX20h4TVkuhCBDot8zOBOzIeaIa1g
	9iI3e73PvAnlXqQfqlLwVnpsAooNZOQoNL0Xi186eg83h3ow7a75Gb5F1k4wmGeoho6beTvnEtm
	D9/HJSuxJATG/pO7TWZdOVx1cRuGmcwTogCuCiNPqUdfmeGOccUY
X-Received: by 2002:a05:6214:451a:b0:921:39bd:6d05 with SMTP id 6a1803df08f44-92139bd6d64mr355239416d6.6.1795663710198;
        Wed, 25 Nov 2026 19:28:30 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a16754sm177671026d6.39.2026.11.25.19.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:28:29 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] gfs2: restart rename when a signal interrupts the glock wait
Date: Wed, 25 Nov 2026 22:28:26 -0500
Message-ID: <20261126032826.4156477-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125185332.2549812-1-agruenba@redhat.com>
References: <20261125175007.3659558-1-hengyul@cs.unc.edu> <20261125185332.2549812-1-agruenba@redhat.com>
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

Hi Andreas,

On Wed, 25 Nov 2026 at 19:53, Andreas Gruenbacher <agruenba@redhat.com> wrote:
> Why not make gfs2_glock_async_wait() non-interruptible instead?
> Something like the below should work.

That is better, thanks.

There is one problem in the sketch:

>  			prepare_to_wait(waitq[i], wait + i, TASK_INTERRUPTIBLE);
>  		if (!glocks_pending(num_gh, ghs))
>  			break;
> -		if (signal_pending(current)) {
> +		ret = schedule_timeout_killable(ret);

schedule_timeout_killable() sets the task state to TASK_KILLABLE again
after glocks_pending() has been checked. If the last pending glock is
granted between the check and that point, the wakeup sets the task to
TASK_RUNNING and removes the wait entry, and then the state is
overwritten. The task then sleeps until the timeout expires. It does
not hang, but the rename waits for the rest of the timeout.

I would pass TASK_KILLABLE to prepare_to_wait() and keep
schedule_timeout():

	for (;;) {
		for (i = 0; i < num_gh; i++)
			prepare_to_wait(waitq[i], wait + i, TASK_KILLABLE);
		if (!glocks_pending(num_gh, ghs))
			break;
		if (fatal_signal_pending(current)) {
			ret = -EINTR;
			break;
		}
		ret = schedule_timeout(ret);
		if (!glocks_pending(num_gh, ghs))
			break;
		if (!ret) {
			ret = -ESTALE; /* request timed out. */
			break;
		}
	}

The back-off sleep would be schedule_timeout_killable() followed by
fatal_signal_pending(), as in your sketch.

I tested this version on gfs2 for-next with lock_nolock, KASAN and
lockdep. The mv reproducer from the patch moves all 12000 files, and no
rename fails with EINTR under SA_RESTART handlers, handlers without
SA_RESTART, or stop / continue. SIGKILL and SIGTERM still end a rename,
and fsck.gfs2 is clean afterwards.

If that is fine with you, I will send a v2 like this with your
Suggested-by.

Thanks,
Hengyu
