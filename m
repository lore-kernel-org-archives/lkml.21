Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690268;
	b=rbvfEsQhEFln3MGEI6Xr8tqOM4298bHwuI/y/N8YMXu4d/e61HHJeQ+ceKDCNx7FyN31
	 564Gul8XrzF9x4FBU9dDyPtCmlzIhDqJlGym7aaHVZOnd6RvYbBeteV+kdrR68CAFsqEd
	 7xMWoG1AyC8a+8/k+Spbq2LD7M15Bc/zu0fZWLorEgYQhQsYdpEZNRkzTFeB865loHRx1
	 i7QktaIR2uK4xsZOldWG/GQ+4sU7EdKH0tbaLvFFqP7H8hi2O5gxgrk5yXqbE93e1oX95
	 RtfJBqjf+JGl/onVqgJnYvxjWRGLSaIyIrztS7LJZp/UJ/bSW2yATSA/MpK4t1YyCNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690268;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=CVdSbvuqngFGYkMK81UV44VU4VJLlbgtcDVIbEqpauw=;
	b=OcLBC4b8B5GqEjtY4wCqK1JBdWTVvjaUiQxyjJdUiNlLnegThK2AUMIRNcmPO+xG79wx
	 Ubp+gyKm2bquSJaES9gCs+rQHIvt5QY84FpH4Q9fKTZZUSC1GlrYT65xGzebrDz39vweF
	 TDR0RUySvmMo634i5vZsxXb9tuOaCHi2L7ync6cqGFx88/0gPfjuvtI3cdL0Y+YH2vdoB
	 pvMYKzebryH/Zzir7PoHM7aG6AWBV2SC2fPawlxW0dCtiJyvM739Mcxtbvg3ki/pJTFmO
	 doefhDHagWppYm6RHl/AvlfyU9CLp/b6Cd0REgszbFNucqXUM5Y+vVpV/V/8xUikg0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WVYiNvwh;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8129D606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8129D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WVYiNvwh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795690266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CVdSbvuqngFGYkMK81UV44VU4VJLlbgtcDVIbEqpauw=;
	b=WVYiNvwhujM2dz6pw1a7qu2FgIUHEMdFTo3zBRJagx1kHyQztZP65BtdiPBBR/aLCIEYdp
	NcD2VaZLdvAYYsJcF9tP/OjG81AMiK3ZK+PXsEVyTE5oHwDX5q/oNJAn96+ygWQNNkofvy
	SWJcN0vu5SOKgz4v9FOslVyi/c5dq+Q=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-638-NdibSaJiMeOeqtEyoPb28A-1; Thu,
 26 Nov 2026 10:51:00 +0000
X-MC-Unique: NdibSaJiMeOeqtEyoPb28A-1
X-Mimecast-MFC-AGG-ID: NdibSaJiMeOeqtEyoPb28A_1795690259
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DC7991955E7F;
	Thu, 26 Nov 2026 10:50:58 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 03D62428;
	Thu, 26 Nov 2026 10:50:55 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Thu, 26 Nov 2026 11:50:58 +0100 (CET)
Date: Thu, 26 Nov 2026 11:50:54 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: akpm@linux-foundation.org, brauner@kernel.org, adobriyan@gmail.com,
	jannh@google.com, jack@suse.cz, sforshee@kernel.org,
	me@black-desk.cn, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] proc: also check the opener's capability for
 oom_score_adj and oom_adj
Message-ID: <awgPDmEbGpJsT_iS@redhat.com>
References: <20261126045222.20770-1-dennylin0707@gmail.com>
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
In-Reply-To: <20261126045222.20770-1-dennylin0707@gmail.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 11/26, Hungyu Lin wrote:
>
> __set_oom_adj() checks CAP_SYS_RESOURCE against the task that calls
> write(). A task without the capability can open its own
> /proc/<pid>/oom_score_adj or /proc/<pid>/oom_adj and have a privileged
> process write to that file descriptor, for example a set-user-ID
> program that inherits it as standard output. The write then lowers the
> value below oom_score_adj_min, down to OOM_SCORE_ADJ_MIN, which the
> opener is not allowed to do.
>
> Require the capability from the opener of the file as well as from the
> writer: check file_ns_capable()

Looks reasonable but

> in addition to capable().

do we really need to keep the old capable(CAP_SYS_RESOURCE) check?

If a privileged opener of /proc/<pid>/oom_score_adj passes fd to
to unprivileged writer, we probably don't care?

Just in case, I am not saying that the old check should be removed,
I am trying to understand.

Oleg.

> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  fs/proc/base.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/proc/base.c b/fs/proc/base.c
> index e6d54193b9f5..42e4645899fe 100644
> --- a/fs/proc/base.c
> +++ b/fs/proc/base.c
> @@ -1099,7 +1099,8 @@ static int __set_oom_adj(struct file *file, int oom_adj, bool legacy)
>  	mutex_lock(&oom_adj_mutex);
>  	if (legacy) {
>  		if (oom_adj < task->signal->oom_score_adj &&
> -				!capable(CAP_SYS_RESOURCE)) {
> +				(!file_ns_capable(file, &init_user_ns, CAP_SYS_RESOURCE) ||
> +				 !capable(CAP_SYS_RESOURCE))) {
>  			err = -EACCES;
>  			goto err_unlock;
>  		}
> @@ -1112,7 +1113,8 @@ static int __set_oom_adj(struct file *file, int oom_adj, bool legacy)
>  			  task_pid_nr(task));
>  	} else {
>  		if ((short)oom_adj < task->signal->oom_score_adj_min &&
> -				!capable(CAP_SYS_RESOURCE)) {
> +				(!file_ns_capable(file, &init_user_ns, CAP_SYS_RESOURCE) ||
> +				 !capable(CAP_SYS_RESOURCE))) {
>  			err = -EACCES;
>  			goto err_unlock;
>  		}
> 
> base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
> -- 
> 2.43.0
> 
> 

