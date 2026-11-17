Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944660;
	b=pR34so6SBJZOzLWz5Ek851O6SnxjSWRHLrk8eGpqTmvSDU1+AmVxATgVzZv4QIdqeauE
	 NOL1qKDxKIksfkGECPGcTnNL8GNVXLVury2yHYQkgU3yzIxfR1HVfJ3ZfD/PRsmNVtZgs
	 JMnl0i7CEsXcWQnlQzmraq9s3G0NO7GeDahprsD6pmg1hOMOqfsDo1ZAterMFRip3pUpz
	 LELwRGKeVsBVePWDb3ReQOjkwSia0Oyz4v0SDyq6WOnbBOjUpEH3GrrN80dT0338Vp6eW
	 4b4bHHKg4RRUu4YOU4+MRrXsrDyIajjUxhlfV6DM+96mlqkcnulF5JiKRtqohmpZtSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944660;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=Ax0kkT2O8/fZvPBQS6WtKqLXaPZ0xrQZdDo9x9X9P4w=;
	b=2mU3mtFGZ5ScbcspyCITDfvoGqdPmJ9x02WGino/8R35c3r3omXWyT3J4oYsiTG6Sv+X
	 kfse9TttB4l1/oVkmCqIhVQt7CxZZLvO+tieIttV7UiHgTvRQo3Iy+fM90vvQ40PCLuLI
	 iw3/zwbCMcDmIScExefY55XIEq4o5YgPu/eKlO1I+R3DTzw87TIFguh6vYqFUJX4zvgL+
	 q/eweep2lWbNxIYUTaNo9/pEE0WzZnfJ8I0yz2pOiMnlRheLIYmVRq5BaPkLa5Ros+c9D
	 xcbi54w9Hu+wb3cfHDRDhvjBkdmnJzhHv3plXJssu/LbQwxlrhUbsq09HcSbw33gvnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hA1aR4dn;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71A1606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E71A1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hA1aR4dn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794944658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ax0kkT2O8/fZvPBQS6WtKqLXaPZ0xrQZdDo9x9X9P4w=;
	b=hA1aR4dnYdH5Q04E/y71pcKx5ls0At7wxdjA4AlR5X464P0nuurZdnLHTtRke7iP5ZttwM
	dXX9bjVErQ9tD/5aQt5ZeqdM5KtPiwrEnvE7I4phjFdazOIi2vnz7eboJO5KbcVryq3ZZY
	QLaR0y816zG7ewoRtJhCeGz+D8u8Zds=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-437-hurC3S8VNsqf_44_NxtVuA-1; Tue,
 17 Nov 2026 14:44:15 -0500
X-MC-Unique: hurC3S8VNsqf_44_NxtVuA-1
X-Mimecast-MFC-AGG-ID: hurC3S8VNsqf_44_NxtVuA_1794944654
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F0D0218002C3;
	Tue, 17 Nov 2026 19:44:13 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (bmarzins-01.fast.eng.rdu2.dc.redhat.com [10.6.23.12])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E2631801971;
	Tue, 17 Nov 2026 19:44:13 +0000 (UTC)
Received: from bmarzins-01.fast.eng.rdu2.dc.redhat.com (localhost [127.0.0.1])
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.18.1/8.17.1) with ESMTPS id 6AHJiCYR3828340
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 14:44:12 -0500
Received: (from bmarzins@localhost)
	by bmarzins-01.fast.eng.rdu2.dc.redhat.com (8.18.1/8.18.1/Submit) id 6AHJi9BD3828325;
	Tue, 17 Nov 2026 14:44:09 -0500
Date: Tue, 17 Nov 2026 14:44:09 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Sarthak Kukreti <sarthakkukreti@google.com>
Cc: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Eric Biggers <ebiggers@kernel.org>, Brian Geffon <bgeffon@google.com>,
        David Stevens <stevensd@chromium.org>, dm-devel@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dm-verity: export verify_wq to sysfs
Message-ID: <avyuiWKNFN19BSJB@redhat.com>
References: <20261116223301.1706170-1-sarthakkukreti@google.com>
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
In-Reply-To: <20261116223301.1706170-1-sarthakkukreti@google.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Mon, Nov 16, 2026 at 02:33:01PM -0800, Sarthak Kukreti wrote:
> Under heavy concurrent read bursts, dm-verity workers blocking on
> dm-bufio reads or locks can cause workqueue concurrency management to
> spawn hundreds of per-CPU kverityd threads across the system.
> 
> Export verify_wq to sysfs via WQ_SYSFS so userspace can inspect and
> configure workqueue attributes (such as max_active) per dm-verity
> device under /sys/bus/workqueue/devices/kverityd-<dev>-<id>/.
> 
> Co-developed-by: Brian Geffon <bgeffon@google.com>
> Signed-off-by: Brian Geffon <bgeffon@google.com>
> Co-developed-by: David Stevens <stevensd@chromium.org>
> Signed-off-by: David Stevens <stevensd@chromium.org>
> Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> ---
>  drivers/md/dm-verity-target.c | 22 ++++++++++++++++++----
>  drivers/md/dm-verity.h        |  1 +
>  2 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
> index 306ed1f6c118..730adf931494 100644
> --- a/drivers/md/dm-verity-target.c
> +++ b/drivers/md/dm-verity-target.c
> @@ -18,6 +18,7 @@
>  #include "dm-verity-verify-sig.h"
>  #include "dm-audit.h"
>  #include <linux/hex.h>
> +#include <linux/idr.h>
>  #include <linux/module.h>
>  #include <linux/reboot.h>
>  #include <linux/string.h>
> @@ -26,6 +27,8 @@
>  
>  #define DM_MSG_PREFIX			"verity"
>  
> +static DEFINE_IDA(workqueue_ida);
> +
>  #define DM_VERITY_ENV_LENGTH		46
>  #define DM_VERITY_ENV_VAR_NAME		"DM_VERITY_ERR_BLOCK_NR"
>  
> @@ -1065,6 +1068,8 @@ static void verity_dtr(struct dm_target *ti)
>  
>  	if (v->verify_wq)
>  		destroy_workqueue(v->verify_wq);
> +	if (v->workqueue_id)
> +		ida_free(&workqueue_ida, v->workqueue_id);
>  
>  	mempool_exit(&v->recheck_pool);
>  	if (v->io)
> @@ -1421,7 +1426,7 @@ static int verity_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	struct dm_arg_set as;
>  	unsigned int num;
>  	unsigned long long num_ll;
> -	int r;
> +	int r, wq_id;
>  	int i;
>  	sector_t hash_position;
>  	char dummy;
> @@ -1637,6 +1642,14 @@ static int verity_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  		goto bad;
>  	}
>  
> +	wq_id = ida_alloc_min(&workqueue_ida, 1, GFP_KERNEL);
> +	if (wq_id < 0) {
> +		ti->error = "Cannot allocate workqueue id";
> +		r = wq_id;
> +		goto bad;
> +	}
> +	v->workqueue_id = wq_id;
> +
>  	/*
>  	 * Using WQ_HIGHPRI improves throughput and completion latency by
>  	 * reducing wait times when reading from a dm-verity device.
> @@ -1646,9 +1659,10 @@ static int verity_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	 * will fall-back to using it for error handling (or if the bufio cache
>  	 * doesn't have required hashes).
>  	 */
> -	v->verify_wq = alloc_workqueue("kverityd",
> -				       WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_PERCPU,
> -				       0);
> +	v->verify_wq = alloc_workqueue("kverityd-%s-%d",
> +				       WQ_MEM_RECLAIM | WQ_HIGHPRI |
> +				       WQ_PERCPU | WQ_SYSFS, 0,
> +				       dm_table_device_name(ti->table), wq_id);
>  	if (!v->verify_wq) {
>  		ti->error = "Cannot allocate workqueue";
>  		r = -ENOMEM;
> diff --git a/drivers/md/dm-verity.h b/drivers/md/dm-verity.h
> index e104a651c657..53f894f259d3 100644
> --- a/drivers/md/dm-verity.h
> +++ b/drivers/md/dm-verity.h
> @@ -71,6 +71,7 @@ struct dm_verity {
>  	atomic_t corrupted_errs;/* Number of errors for corrupted blocks */
>  
>  	struct workqueue_struct *verify_wq;
> +	int workqueue_id;
>  
>  	/* starting blocks for each tree level. 0 is the lowest level. */
>  	sector_t hash_level_block[DM_VERITY_MAX_LEVELS];
> -- 
> 2.56.0.679.gc527c65306-goog

