Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019656;
	b=wePKlNnqLyUZi0d1nig/UsGx0FyCZylC4kYJq4FomlSHlGMXmwblomqUNlHHqDDPkpnC
	 S9RrQKWYl8oHT/OHU+M+iepQ8zLmdAO/oQ0LP7mUBsgpqEmqEIqzzAC+a4kc802S/j2n9
	 dGhsugAfpiywIcxShWfe8631+t+6XhumxhC5j/PjqYmUrSeogU24Ps/HimKpf3fYBeVDU
	 N1RapRsmdcD4IsxDJdJdCL6WshWt2A1vJCVN1yIET0Wtn648sqWcRarw/ZzpvvND+g46i
	 IDYmo3z+RlhWOqZ/CwX7oaKR56GenWuktKvpB2vhDULchXMoIlrTX7JTtDL4WFsdUvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=C0uQO4m5AZQuZD/qmLkcdjegER6bbbPKAATaLMex7+s=;
	b=Yxg88BBmKEtQXx1y9D9/yMwksbd9SJVkDB0Gw2JLfjzvkqqGVEDSypPCSBY0RIJXSeKv
	 fETTrq5ouFQc+rzPNfg8IP1gCP3rSkllNJLQ4SsV7KeVuaO7LTA4ccOJlUrSxsuYa9Joy
	 dX/1lSriy57LRHgpkNjACfI2MYzdf6cPjGoRf+pxo0ArIR82n+7/k0sxh5jpZIaYHPcbh
	 0tDawSPi6ZS3kiVkuzqFvvZo3kbGzopePO3ykKA59F0jJkscwxZqoDlxRxYATHOKb0P36
	 AakBe0vLjDVigDXlpc2eXsy5qGChOQzwcIAg9cClVg5QFK98n9ZwrGqpsUBJxDIRtkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ursulin.net;
	spf=pass smtp.mailfrom=ursulin.net;
	dkim=pass header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b=Zw6qWe1d;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E975606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E975606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.a=rsa-sha256 header.s=google header.b=Zw6qWe1d
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e47347279so750429f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1795019650; x=1795624450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0uQO4m5AZQuZD/qmLkcdjegER6bbbPKAATaLMex7+s=;
        b=Zw6qWe1dklum+Q3iocRUaXuOiybw8tOrFbJZ9YlFPUIvClKNgcXXbCyqkBZ7R9bQ4q
         xPGmBQEfYtaHInvo6M4pZ0MDN7fWysAmKwK9Xcc0mIuCV0BWRmTKKPpFH3jwoi49SeXI
         KLYyVV3B770TjhIO07zL8xXqS4DqaOjPcvTKr98LrdYgC/fzDEs9ECyYfXN46ZbX5BUj
         gL8oCcJNAyDIHpbzRTu0STpvmYS2bqf4GPKISOeJDEqIxlIruksj+nHs/cGSgjtCZDdr
         aXq4T+KRavv1NcZ5zrOIzBxH7cl6xvxMYoWwcCKK/Yu09Be6V92sZC5KiPATpgyU23ju
         k0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019650; x=1795624450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C0uQO4m5AZQuZD/qmLkcdjegER6bbbPKAATaLMex7+s=;
        b=D5CwvHOWnBcM8B9DXrKQK4TihZzcOUtV7tHfoJgNzgeTjv55Yzun7IylIfmDWJGX5i
         hY2i64lpoW4CzWvId8n+g07k0yq7qGnCztYaEjebKoiTvWpay0jvjDWQ2HEixkTupVPv
         sata862RVpU2lMmq0pZzRjgOMm6+3iLIPtU/cBNnedsWsedEMabgUEu3j5y76BiyNbAc
         cGoPdV4YqHx86AuEYdZFaP7P13HOXRMIUQo5zPvm+pwJdTgImo6mOE9sE9xPMz5QvRPW
         +Qxg3bb5tk0But40qkOd8OmRquZTPY5dpGnUysfTZYM+mXxOT3BveJ+8jMTRN0N1pOK9
         U4Ww==
X-Forwarded-Encrypted: i=1; AL+hErHrJGgCTo8TgaZ920EgKZLOd6e+AsJbnQ5l8VhUOQNtH24M5NA4yj74TcEKv7i3POus+GNTTBtok2zLA7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PsuA3Tm9Z4+zRL2DtoJNzGiahi9kzeFnWb3gf6nQPyloY5/MR
	k/0aOc6xJokhwDgmU1wQH6tKtErRp7CNAXr7hVdSzXa4iJF/uNjOrbEnyKRO/m84+vY=
X-Gm-Gg: AZFdTZc57dXd3tBMrbdhqn7kLQV9grQkXRHR/ug0gv6KiS+3oCs1EIS1gP2Z3jGJH39
	l1iYK1/s6xdGYYxjVvIL9wisZCcYFplDlIJ4YtV32tMuNGIO7+H8i1Z1T/Xug1BTBVe74h5CrS4
	3jn81pTqehcfV2RFjXT7xPYhnHDxPMy9K1PpZSJkCV4ZygGr+IUE1GCWd8vRHsydnyv0cbh0UmV
	Gdrji1Ix60w5hBurPj+CwfRMYeyce46qK7NW+oS2pulrlknVjwBeJWyWsmcsKltS5tlxM5t4M+9
	lTpG8qejw514+M9NhPZur4IBfCBKfkc07NFKKG5lRX76bnCKm7cun/qUOrxHPjda7GAhofB4nKi
	yL5Be0ppHKT2eKwpFS4beF00yBBSpm6dzTy/LX7QHkei5PREiX94+KqYqlU3WOA0P1OC36J5RZE
	I6vPdV6skStlyUoXCh0IwT7tOrEzI5h4EYzANDqcA8EIQ2np/54qubFTyt/w3hohXEyR7rGDaFR
	s41KRuO9vCiQI+n5YzB+g3Lxn6JEM/s1/6WSDvwrKPuhW5sX7bv8n6FdQJSD3MJcY+wh8pMCW5Y
	1LmDJHP0qW2vxPJxJ/63a/CPJPLCwQDqK7LCT5W3sCpxpw==
X-Received: by 2002:a05:6000:1610:b0:491:e062:383d with SMTP id ffacd0b85a97d-4a63d1daa1fmr4563395f8f.57.1795019650348;
        Wed, 18 Nov 2026 08:34:10 -0800 (PST)
Received: from [192.168.0.116] ([81.79.79.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2e26csm5659578f8f.4.2026.11.18.08.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:34:09 -0800 (PST)
Message-ID: <598d80dc-1269-44ff-8852-b63b6ab57ea5@ursulin.net>
Date: Wed, 18 Nov 2026 16:34:09 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] drm/sched: Add drm_sched_entity_get_runtime()
To: Sidong Yang <sidong.yang@furiosa.ai>, Tomeu Vizoso
 <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, ckoenig.leichtzumerken@gmail.com
Cc: mcanal@igalia.com, Heiko Stuebner <heiko@sntech.de>,
 Gyeyoung Baek <gye976@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
 <20261112171144.3151554-2-sidong.yang@furiosa.ai>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20261112171144.3151554-2-sidong.yang@furiosa.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/11/2026 17:11, Sidong Yang wrote:
> The scheduler accumulates the time each entity's jobs spend on the
> hardware for the fair policy, but drivers cannot read it. Export it so
> drivers can report per-client engine time through fdinfo without
> keeping their own counter.
> 
> The stats object is refcounted and held by the entity and its jobs, so
> unlike commit df622729ddbf ("drm/scheduler: track GPU active time per
> entity"), which was reverted, accounting a job does not touch the
> entity.
> 
> Suggested-by: Tvrtko Ursulin <tursulin@ursulin.net>
> Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 25 ++++++++++++++++++++++++
>   include/drm/gpu_scheduler.h              |  1 +
>   2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 03e68b4102d5..ac040f95876a 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -238,6 +238,31 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
>   }
>   EXPORT_SYMBOL(drm_sched_entity_error);
>   
> +/**
> + * drm_sched_entity_get_runtime - Get the time an entity's jobs have run
> + * @entity: scheduler entity
> + *
> + * Returns the time the jobs of @entity have spent on the hardware, measured
> + * from the scheduled to the finished fence of each job. A job is accounted
> + * when the scheduler frees it.
> + *
> + * The caller must ensure @entity has not been finalized.
> + *
> + * Return: Accumulated runtime in nanoseconds.
> + */
> +u64 drm_sched_entity_get_runtime(struct drm_sched_entity *entity)
> +{
> +	struct drm_sched_entity_stats *stats = entity->stats;
> +	ktime_t runtime;
> +
> +	spin_lock(&stats->lock);
> +	runtime = stats->runtime;
> +	spin_unlock(&stats->lock);
> +
> +	return ktime_to_ns(runtime);
> +}
> +EXPORT_SYMBOL(drm_sched_entity_get_runtime);
> +
>   static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>   					  struct dma_fence_cb *cb);
>   
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 3b0978fa8cf0..96a3401d4c88 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -730,6 +730,7 @@ void drm_sched_entity_destroy(struct drm_sched_entity *entity);
>   void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>   				   enum drm_sched_priority priority);
>   int drm_sched_entity_error(struct drm_sched_entity *entity);
> +u64 drm_sched_entity_get_runtime(struct drm_sched_entity *entity);
>   void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>   				   struct drm_gpu_scheduler **sched_list,
>   				   unsigned int num_sched_list);

LGTM.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

