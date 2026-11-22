Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359264;
	b=heK0qfXTkba7eGdrUt2lWQr66T+BDuSlm/lizSfHd5MrNfs+HgJ9ogGKWbG3AeHl0MMg
	 xjLvcH5PuX4GQkw02+9Wh5WJWOR4+5YV1VGX5jrNGumBvtfbZs35iNkqmssVhLYaJoSM/
	 EAT4EQ2abAfaRPhUVr67AUDFQvl0tb9RXJSd30Xprs6V4wY2yZP4Iuu1fWfo17g1cYR1p
	 2qbqW3Etrvs0KCWbd7lC3CdyrS0lRTBO9vCzP6d7MPpP23rX127PJ+t54GurSG2200b+M
	 5nlw/G6ne/Dl5WzVxeWyOOvD8Sk8/9GhJ5rs22x37mfWxxwFFxGCwN7sVyDFFLvvX0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BLuKTBBJtTtRTcmaK0xkcTceOMHbrjEKndUknDgiKJ0=;
	b=iSkAbP7RkPtKVldEwgZo3p4kUp237BMvoY9qvpUuRKcw0J+imK2Flx+zBft+DGDq6wfJ
	 Ht0CBeWp8zLEgv4jhyJi0/QX0WwVEtNk5qf69TV0ODP722YQUNJhwZOObK7kaaXzt0HMf
	 HFeNEqwLGX5Xb5MOykf5XOsSm2ZZhHrhQUB81efSegjBKNgDyYG1aDgW64NFdboEX+S2M
	 lUtYptai+Vr2qLQcdaAOSiOST3muJy7De1vZsVbx85TSJBb/OR2nJbpKNgY6L8uQuGrl9
	 lEF2zVfhLaS2HRGw//krHm2MbyO0kv923UobAM43E0Bdvcnvbx3fPH23VuWWtxScTFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Etck9mxF;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDBE606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDDBE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Etck9mxF
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4395d31228so391951766b.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795359262; x=1795964062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BLuKTBBJtTtRTcmaK0xkcTceOMHbrjEKndUknDgiKJ0=;
        b=Etck9mxF/QaMZSJYD0VgQM21xOPiTBZubmVAiMRNUYGSpqGh6qywbjT3s3oRJpwir1
         X19Jm9yoQesj2bU17qcnFxpJrJMxs6G7nEFHRNt6Sdye6I1Mm35l7PqZNeB6DiS9ALv+
         uuRzOy7F1xqqMt4qM7xdrDIaev3eBR+ACNERzzsP3ceFacvh7nwNa/Lxw1NZE0bKa39F
         CtlANzNO1iH6fztlFc3rCH2Q33XQsChsgs86uDOhN/RG8SSvbA5KB6TozwDdictQEMLw
         CTRiUS82NIxzzBVR6dvKUng/Q/Nb3eqIaccYrHZ4M4KHJIGl1T0n5nE4NhKyx3N06fiR
         PulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359262; x=1795964062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLuKTBBJtTtRTcmaK0xkcTceOMHbrjEKndUknDgiKJ0=;
        b=MuzkggfjS1J6+fCcirKpgx0pBF4bFgpVbQ1Tyvp84gY8BhprVZVhIBzh1jqvTqeW8j
         yImMoQ6tq6gJ7FnnQ+SqEfXiY6RliMBc0ypq0HwFQS+LgV7C/OWTuD9zVNdiAkiGvOpM
         IBOq3XWVFcj3CfVoo9lLyTj2H/mnuJV9s9ohtfnkhi52rjUkMXCft7fMwZMQfu9+oDAD
         WjlyP9vq19slYsoP4pb80xM7wZUnczVUdzQiX6AIXDAbwWV3JLIrJhJ35aFmlRARONLL
         VK5EVDfVLUVpuIloB2nW4vaAUpmCWY4YbdEtcXVFQ/O6dxeJLygAWgg1LGQHTDKaaxfk
         m5Qw==
X-Forwarded-Encrypted: i=1; AL+hErHC/zvOcghbeL883ouyMkbMzpXjIc//1DJQB8Cz54wC4aGbzCft/J71f8RqGLSuUMa/kgLXJHcHx6wjR2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4xBL6BFGmjYfFhLHOdJvYl3Tng4IRgkF4F+JVVp6T8nlswVyw
	6vwzjW4rk8hSV/Pr0WPCrOYnzfIYBQ/7pwQHXM2N0FyXLIlPmKGARy6+
X-Gm-Gg: AZFdTZcTpWh1OrObrdELQToEvMQEdV5ikwXqjOJyQ08Ykb5GAt6SpeBlw7SW+kvwtCN
	BEqVO50AXrn9jnfrmBBjqDObn6Vvx05TJRED0SUcYBpNhyjYJbbz05nwAW8D92hYHVeW10Bqu3U
	Ru5Vl1iz4QaGKJAf3jC7j3GK3t+kvehxKcFXu6v9XAJGsDaif6wGk95qHjkxVmF1z7johGz4tkm
	C/2vxF6GFhe2u9BwSsNKyys13H8c77RsYTPt47+046FHdT1LAFJHd0iZ46fxPEmtwSCMbdBFFaL
	QUqxZIa8ldvqBFwI+jnUIKUt78w3BtOcNhKtvrVw9SybUyVGm5rtdjjqdKRSqKVYOaG3KuQaGfe
	KQdUZPqQh0tidSsitwDiSt6urP4bPRDrSK8+q+iBgrslHD7Ja+gAzT1T1JXDAWTl2UDVERJ51qe
	DLN20IE6ZUbjObq/c3e+djEAOxf4WihvWSwfVECl5NCX6VhA5EKFWJeWPuK55d8ZkpjTaiHDx4c
	zG3/SQcBQ5sbxth7wXTM824eUd/UCuB9qdo4qFTcV/aegsh3kkeWBj1MWuTUYvY0hqWRw==
X-Received: by 2002:a17:906:5006:b0:c50:5e10:71ae with SMTP id a640c23a62f3a-c513a5e2124mr612735266b.17.1795359262076;
        Sun, 22 Nov 2026 06:54:22 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afec08asm319529566b.73.2026.11.22.06.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:54:21 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Sun, 22 Nov 2026 15:54:19 +0100
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: Re: [PATCH v2 2/2] mm/vmalloc: reject NULL pages in
 remap_vmalloc_range_partial
Message-ID: <awMCG7g-oWkqeog1@milan>
References: <20261029-vmalloc_remap-v2-0-c4705cbf26c2@linux.dev>
 <20261029-vmalloc_remap-v2-2-c4705cbf26c2@linux.dev>
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
In-Reply-To: <20261029-vmalloc_remap-v2-2-c4705cbf26c2@linux.dev>

On Thu, Oct 29, 2026 at 05:19:08PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> remap_vmalloc_range_partial() passes vmalloc_to_page()'s result to
> vm_insert_page() unchecked, oopsing via page_folio() on a NULL page.
> The NULL case cannot happen today because VM_USERMAP areas keep every
> page mapped, but nothing enforces that invariant. Warn once and fail
> the mapping with -EINVAL instead of oopsing if it is ever broken.
> 
> Suggested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/vmalloc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index a888eca016a8..dabef40ea88b 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -4906,6 +4906,9 @@ int remap_vmalloc_range_partial(struct vm_area_struct *vma, unsigned long uaddr,
>  		struct page *page = vmalloc_to_page(kaddr);
>  		int ret;
>  
> +		if (WARN_ON_ONCE(!page))
> +			return -EINVAL;
> +
>  		ret = vm_insert_page(vma, uaddr, page);
>  		if (ret)
>  			return ret;
> 
> -- 
> 2.43.0
> 
LGTM

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
