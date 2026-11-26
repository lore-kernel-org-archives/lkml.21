Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714111;
	b=z5lKIrMVX0YQoAxkOe1ySls8FqQqmIb2vjpf2oFpOjz4vu0iL6ZOVk8kUQYTnLiYf3p/
	 zcki0AdtW2wuw+JQoT9dx7DWsEEREtLyUMeEk57dRFzf42m52UIeBLfuoy3reLEvBWE9N
	 46pvcGQYQZ0fTLbDmHToY/Aft52A6TXgljtton+orNsPEY8TM6nORDVLmR1qfdmQN1EBX
	 F8QnjN6AWSg9XE5Z21uGocDj7igrinvr19IUYu0viZlxZjGLehccJFlAIUCOi8YnByHYI
	 RRHCXct9ieavPIo+t9ZkFbr5jsp3YG9R6NCiNS6VqKCb8/vQveGPCCfI3M4L+RGuAVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Mgn+JYoJ/h5QGFKbr5yJl/E/L+YyGxNW0QvmTxTy/B0=;
	b=jZBDRkCrnfECErGkmX4y5bWe1sZW3P9yn8orbFl/QXrc6OHH1a9LRG7gLH3CBl88fq9F
	 aw7s16+FAHlmmOeWbupYytE45bOe651QqzbllBopw21+jCCVG1vhZJK7RWDruajOJuq4r
	 eEKtgkJAzjm0DVYbA73n5InleIL9ASivbAPhLev0/Y4pNFkxTV0VYD0iKH/j8tl/0UhZk
	 LtHRDFNrkjYJxVjOjFOTSUpSxkNg/yHxTAuranofz3MDEK/mM8qKBL8PH3OlN9DTPJbcU
	 ppYjxjEBiOHtqUR7YEOPAVx+RXO3VRkyK33AnQjzlMP02kV9PghcjOSwbOaSyGYBGgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QoB8j2ye;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA818606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA818606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QoB8j2ye
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b49a6e8212so2881186a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795714110; x=1796318910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mgn+JYoJ/h5QGFKbr5yJl/E/L+YyGxNW0QvmTxTy/B0=;
        b=QoB8j2yeoaBu4OKCc15l3LNhRBuIyCAGuOGQmChx68G2ipA1WcbR9U7U64RUAYUfVG
         mwV1hLSnBiLA8FF36Ztx2a1qRqWzgnTUtteNx24RHEjsfPhmMLQh3gCVFBugZd6WOodu
         ZyJcIGfU7OxcIsgkMFCSPf2LreDUWVXP3sNZPtKmmugNPB9ASEoeDp9RViDRLTSbZWL1
         svI65WBrnoRUxJa3IdAXBkn9q7ZhW/791mev+rbj4dwZ1OMjJJZNzc7eD2y2Ple/jl66
         oohOm/x5/2X8UvrbLc8uiK5Ktg6fle8CgtCMuN5cyhKlOd7ekVxnhn/EYwTpPwXOanHQ
         GKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714110; x=1796318910;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mgn+JYoJ/h5QGFKbr5yJl/E/L+YyGxNW0QvmTxTy/B0=;
        b=LOOSFtLKL9gUWjp/Pu/605Txops0nq3v3SmS/JU4xxKFX2uumzkgN3zAIg3F4dzMFe
         DjBHylRCz3zuEz8J5nvx4fFzTVV+QGaL7+mFhaRb74XmFMIpMG1UcmOGdLoJfh0IPpAi
         Sz71517RMo3uGad5J1Z8UzKmrkCoZqZMtXKGc0ueYrO1O39GssPjSC6rEf6Gme4oIwjH
         IBiATOC0o5CI8T0El2jLk931oZxonjNA8SP7HY7s7zGG36vgn0Zk3zcbU//0QrHzAocG
         EJVvKaFCVQNRA0C1sc2rrCDWHfVSD93uI7f0OrVTM8hneFKEsDek31gplRvRVubm8OGb
         LCuQ==
X-Forwarded-Encrypted: i=1; AL+hErFvweNzAM+NhlnvqvQBKVNx+U2ScmQ2AiDrc17yG6IVB6VAen/Jq19dVI/8rXjByNjNPgsaFNR0nQoT8aw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yBsqpGTbUmfmztjb5K1C+QeMrbueDA1AKRu2ggpGsSTPm8V62
	H53bFtJTI7b6p45oyx/w+Qm+SXbmKgXdJaZ1/ZaRw927SBwMsOrx+0zZsGceORRuVnc=
X-Gm-Gg: AZFdTZcKPAZZJ0fL4qt7R4H1LJ8qv4CYlFPxVkwWT80P2QVvPF/+Qi0uAETliGLrMT0
	tfLpf+Hm/CQ/3Ze4HiEt3ffIULg4N4sUDHCXbyUVaam0ttM0B5Hd9o5lAfxHW6y4EVhEEMtKBDL
	QcwQvqgC7RVh1kcuqcmgU4iNqcaCmepm5T6TJPW9Wkk1Wk1XPzLm8xRn1f1pAHId1dD0YRNzCpj
	aFaMICEJQypOLcIzD6r4HoxN1T3vcl6NS/+xSHTgZi6ZujTm2/6Wcx0UTBKyfsgbstE/F8egvxJ
	ZZJQu501B3gBunzLiRVTnbrPA77iwnZ2IlrTnVXAYmc5IEI+7OP0q3YCWa4qA3nGCcKmNPAnpjP
	57nMEIHkwiEMxaOrfJu3U0e0qJtMkF7t85K9D1zva9mYrRYOndiO0iPH7p0603XONnAq+VUObD7
	4NWxT6/LyB9cWTWlv7pZSpSv5mVnfuRrdrOraAAs5SbmhsfHzcGU+EEmXWGk5FqS+7rmX8N3QjT
	jJVKxa6LZYIF4GG4gBYKfL1pb1xnuDuucbDQ5q6aPMNjlWlPtjRAtDZkvnSVBFujAouT5hx8Q49
	3AY1S2V19Hc5AK2KlEHW+v1te6Lkg0xM
X-Received: by 2002:a17:90b:2e8c:b0:3b3:b373:6a6a with SMTP id 98e67ed59e1d1-3b41c9e45c3mr21615927a91.28.1795714109742;
        Thu, 26 Nov 2026 09:28:29 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:ce00:143c:88b9:bd58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8733e6sm12843860a91.3.2026.11.26.09.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:28:29 -0800 (PST)
Date: Thu, 26 Nov 2026 11:28:27 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: debugfs: use sysfs_streq() for write parsing
Message-ID: <awhsOzu4o_Zn0uVa@p14s>
References: <20261116184230.1885-1-saileshnandanavanam@gmail.com>
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
In-Reply-To: <20261116184230.1885-1-saileshnandanavanam@gmail.com>

On Tue, Nov 17, 2026 at 12:12:30AM +0530, Sailesh Nandanavanam wrote:
> The debugfs coredump and recovery write handlers compare input with
> strncmp() bounded by the write length, which accepts any prefix of a
> valid command (e.g. "e" matches "enabled"). The sysfs counterparts in
> remoteproc_sysfs.c already use sysfs_streq(), which requires an exact
> match and tolerates a single trailing newline.
> 
> Switch the debugfs handlers to sysfs_streq() for consistent parsing
> between the two interfaces, and explicitly NUL-terminate the copied
> buffer since sysfs_streq() expects a string. Tighten the length check
> to leave room for the terminator.
> 
> Truncated commands that were previously accepted by prefix match are
> now rejected with -EINVAL.
> 
> Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_debugfs.c | 33 ++++++++++---------------
>  1 file changed, 13 insertions(+), 20 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index e8e7b6a3769b..ef6761a13c6c 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -73,19 +73,16 @@ static ssize_t rproc_coredump_write(struct file *filp,
>  				    loff_t *ppos)
>  {
>  	struct rproc *rproc = filp->private_data;
> -	int ret, err = 0;
> +	int err = 0;
>  	char buf[20];
>  
> -	if (count < 1 || count > sizeof(buf))
> +	if (count < 1 || count >= sizeof(buf))
>  		return -EINVAL;
>  
> -	ret = copy_from_user(buf, user_buf, count);
> -	if (ret)
> +	if (copy_from_user(buf, user_buf, count))
>  		return -EFAULT;
>  
> -	/* remove end of line */
> -	if (buf[count - 1] == '\n')
> -		buf[count - 1] = '\0';
> +	buf[count] = '\0';
>  
>  	if (rproc->state == RPROC_CRASHED) {
>  		dev_err(&rproc->dev, "can't change coredump configuration\n");
> @@ -93,11 +90,11 @@ static ssize_t rproc_coredump_write(struct file *filp,
>  		goto out;
>  	}
>  
> -	if (!strncmp(buf, "disabled", count)) {
> +	if (sysfs_streq(buf, "disabled")) {
>  		rproc->dump_conf = RPROC_COREDUMP_DISABLED;
> -	} else if (!strncmp(buf, "enabled", count)) {
> +	} else if (sysfs_streq(buf, "enabled")) {
>  		rproc->dump_conf = RPROC_COREDUMP_ENABLED;
> -	} else if (!strncmp(buf, "inline", count)) {
> +	} else if (sysfs_streq(buf, "inline")) {
>  		rproc->dump_conf = RPROC_COREDUMP_INLINE;
>  	} else {
>  		dev_err(&rproc->dev, "Invalid coredump configuration\n");
> @@ -211,26 +208,22 @@ rproc_recovery_write(struct file *filp, const char __user *user_buf,
>  {
>  	struct rproc *rproc = filp->private_data;
>  	char buf[10];
> -	int ret;
>  
> -	if (count < 1 || count > sizeof(buf))
> +	if (count < 1 || count >= sizeof(buf))
>  		return -EINVAL;
>  
> -	ret = copy_from_user(buf, user_buf, count);
> -	if (ret)
> +	if (copy_from_user(buf, user_buf, count))
>  		return -EFAULT;
>  
> -	/* remove end of line */
> -	if (buf[count - 1] == '\n')
> -		buf[count - 1] = '\0';
> +	buf[count] = '\0';
>  
> -	if (!strncmp(buf, "enabled", count)) {
> +	if (sysfs_streq(buf, "enabled")) {
>  		/* change the flag and begin the recovery process if needed */
>  		rproc->recovery_disabled = false;
>  		rproc_trigger_recovery(rproc);
> -	} else if (!strncmp(buf, "disabled", count)) {
> +	} else if (sysfs_streq(buf, "disabled")) {
>  		rproc->recovery_disabled = true;
> -	} else if (!strncmp(buf, "recover", count)) {
> +	} else if (sysfs_streq(buf, "recover")) {
>  		/* begin the recovery process without changing the flag */
>  		rproc_trigger_recovery(rproc);
>  	} else {
> -- 
> 2.34.1
> 
