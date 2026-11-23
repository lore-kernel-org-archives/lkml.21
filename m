Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428691;
	b=oYtqUznvjm1as3SKkGDaN5bmSeG2lz05MBm45C291mEU1hPLkVUSHRNBmlgabtB32P4g
	 6/QJnsZsMAIDxup8lmdfUivoDWqAILX1p+3RAS3II0cTqqmIYfSD3rvN8irbVP4HKM1dD
	 kMn7z/rpaV77yo7Z9Y0hNZLCO4AMJyBpTfriTj/hQ7nZ7xfrviUrvx2OlZuLfBX2i0XAV
	 0rJ8ORR7sWuZGSTq+5tqca52fi9yYKZMHt+H54U1yK/dNsroOUbFwmcmq5wWIZgJImBWm
	 J3wArB1E+ikSsya8YdxGWiYqsMN+0KyQRO81AjpkETI9aZRG2su54+H1oqk6k3yuEAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DwLiyOh05b0NI0/gh6SV/G295VOAZ2Tu2Ln3fZH+sNU=;
	b=F6fYAcm14LVDUcz7sSeVGmsDxKrvuSrbToz62vFE1JZVehluKvN96mAWaTGtMCyAOjew
	 BXLqOkcJ6/u0VPkQxgo2uHnGkcJRTmsyrkI6KmFPVNOhCUADUnsziB2VIeo/XfePIbwVD
	 tvIjNyFWnXKb1LK4neeu+0av1BQCRgwG3dI8C3uowNCnffATrwW1WkOsWHhFnw1Fw2hjf
	 YEJa6CJV9j5idlnqZknY5t9b4UBtKnOt+GO5tCTLYbVT2w/HGHM1A3V+m9syw/DqmjSfY
	 9lEYdZBKMLIGfPaAfozvYZU0Z5R/e9ecNGjnehqj7bsCDN2Wq5mrceBOhHPhM13KAmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AvOcnwmB;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAFF606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBAFF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AvOcnwmB
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490f38e9688so2118709f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795428689; x=1796033489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DwLiyOh05b0NI0/gh6SV/G295VOAZ2Tu2Ln3fZH+sNU=;
        b=AvOcnwmBq8inbiI9m2mNOhivNjDhZEVTlZDm2Ioz2x+q6HJmyvypkarwgoWjRWm0RH
         W7yDiHP3z22XFL8S3A5Rb+7TwkPsJf16FwO2E7VKKN2UqolgvoUAI+JXj5atwduzju9H
         OjuUd45u7LEXxAGUyCOHywYEx5CANlprVkxJw2OVA1xTJqcOlUDr5ExDhs0oBCv3CG/o
         TKwY3J3xacQ5dlCQ+7L4UTJJbQL0bxCvj6J5LIobbCngEdB+hJuqbeHHSiaTic6gLg8P
         gIF+bH92BY2pojuZMvGvM8LXsM1JnuQ2tGNdEtDhK+OV46jxW3kexYGxUCSgqpxXxSfn
         IfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428689; x=1796033489;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DwLiyOh05b0NI0/gh6SV/G295VOAZ2Tu2Ln3fZH+sNU=;
        b=U4X+/IMR89v/y3Us2uRHqmcD2iS83GipHIqk9qsubI0UnqA0p596rdnmmdM8XPY9Cm
         ZPUkxfmlAELIK7xY7oMPUGWg9LETq6n2+6GXX6u8bQrqJ6QNEne67+v3nv5qlIb1FUxK
         XRnqgzaZXLfBeTEzIHLGCSsRexquV4tLPM83kdzv3k1N76hOgyT6v9P9I/UIgU4ks+MS
         jbmnVVUS+ofnafY8g8nj59kqapks9Dgp6DYpfSW0azoKzWVKpIyZeW3j/Y3yKC8xCBBU
         4hPQfDTbyNgPZMGyzlk04zDm//9TA8CAZYPHlAjQQo/rvi6qQ9ps0MHtEfJMfUunK82T
         eaMw==
X-Forwarded-Encrypted: i=1; AL+hErF/0IHm/rpINzYdbMbm3u5VvYTwliMaNZ+JRzGGycngqkyfoqwwSMrOVm+GOeXkzr1EQNLetUUaSw/CsuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qNSDfBVDiTxvPb7HkXi6AICgdO82vaXv8UULKUTa/PyQgkkNk
	caCO2INnFWq99KgReuOaBcsnzhZxvGsEmuxlAKsSa0fcku5HCXQtDnXIKBFKAZDbW4c=
X-Gm-Gg: AZFdTZeMcfvrycavbFfP6aP20uFpP+ivRNYgLI/DxJVjdkk34Kb6mIC640YEcl79Czk
	jetKYy+tquQaFyvrpdHsAuevUTsPUQCPAJU5tBGEGx2xx1t1dSiYvOVLpiDcAgUo1i+/WHIElRF
	LRS32zXOfOtsklQzj4ExdmVBRLxOdN2VCEPAPw9joDWjcQUMdVPIc8AKXUEWpZNTx9uzJAVvYh3
	yK/4XdKBVz5YbBeBapDuAIGLGXlfiJqSM/ZC6Jqn4HuksvJBwjunmR6BeEVZfalhZWUhpUuWVnp
	43TIjAIdvMiHpY1GJt+V37WFCGkH3Qge+hd8SEbi0+BqsHjZUt5ZHC+9Ju63Ov3KGw/ig+r7Xwk
	QYSLajJuruN+dNc5QQ0NmUzHHEuilbbZVIL7hxLPExMG4Hb8t5LTa3XXP4QCpGQ5fhUMDXZr8K4
	mBrNqTNn5auMVBZt/0+SCTrsj25cXJLqyLkR3bvAhZjVliYfWRfRUxBlQAzZo3RseIRX8hIqO5z
	EVjIctH7mtM9PMz0wXm1HT+5piIht9rcIPFYDg64kCLmIYqaYIItmRhc/Nh7pHmUrTBlO0qza10
	BO16NJGBIsdBDKPgNI3K98mTcQKetX6FtTHXq/LBR3k=
X-Received: by 2002:a05:6000:2211:b0:493:72f7:1d5b with SMTP id ffacd0b85a97d-4aa5b235116mr26571679f8f.29.1795428689306;
        Mon, 23 Nov 2026 02:11:29 -0800 (PST)
Received: from localhost (109-81-82-199.rct.o2.cz. [109.81.82.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm24009577f8f.24.2026.11.23.02.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:11:28 -0800 (PST)
Date: Mon, 23 Nov 2026 11:11:27 +0100
From: Michal Hocko <mhocko@suse.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>, Tejun Heo <tj@kernel.org>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, muchun.song@linux.dev,
	penguin-kernel@i-love.sakura.ne.jp, tj@kernel.org, mkoutny@suse.com,
	chris@chrisdown.name, cui.tao@linux.dev, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [PATCH v3] mm: memcontrol: don't miss processes whose leader has
 exited in OOM scans
Message-ID: <awQRT7InNqEF-K8-@tiehlicka>
References: <20261121073222.834282-1-zhanxusheng1024@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121073222.834282-1-zhanxusheng1024@gmail.com>

On Sat 21-11-26 15:32:22, Zhan Xusheng wrote:
> Moving the exited leader along with its threads came up on v1, and
> there has been no answer from the cgroup side.  cgroup.kill had the
> same case: da13e0e72a73 ("cgroup: fix cgroup.kill for exited thread
> group leader") walks all threads instead of the leaders, and
> 5f4a3f743acc ("cgroup: don't kill migrated processes through their
> exiting threads") then had to keep an exiting thread left behind from
> standing for a process that has moved out.  This patch does the same
> for the memcg scan; the second case is what the live_elsewhere check
> covers.

Tejun, is there any strong reason to keep the exiting thread group
leader in the original cgroup? This makes CSS_TASK_ITER_PROCS iteration
really tricky and error prone as above examples show.

-- 
Michal Hocko
SUSE Labs
