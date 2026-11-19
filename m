Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100589;
	b=E0G7l06rXmIOmHjmyU12WAqwbePF89X7xVsrIfKexlSZfKMJE5iLy3ZFehRIYLkX0a9m
	 qDzjA1UHvgHVJAerLnChuP+BtybhXnDfrMChedmF2UJvNqBnVs8vTGEm1JIVZGSKfPmn4
	 +2eHdc5OSv9aDstWl/+SHumagBtBhqQH+ZKpknzmE/DmGYvMSK/tNzi7e4EKn25G8IdFx
	 xemSLa8gBpgU49OsBPsvXfEnIzQ9I0O6x6Lw6x9qPeBLlaCnl3KQqsYevom7lXrJx8q/h
	 7r8InSuhD5anWgWoetLnyqfgmy0F8ZbugINeBBA3jsiwlB1lKrTt8DuHeTOPwGelLMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100589;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wnQjVTvQ1FdNEd5V/022XTlNbc2cMP/Jpaz5K1hV8Gc=;
	b=nZMQQYQ9e5oktJguZLKUjPUkvCAVCzBiRafsUUc4omK7kHG1D7Marr/hU4h+nM2TyVZE
	 jiEf+Qgt3dOKHxydKOiebVyZryAfCjrA+T6Nl4mp2DrY5RRpnUMyooKe3sOjf9u2Pg54e
	 j61o8HaJneee/L0yaATrqYkmNkujfW6j897G/Fb/2pFZBPhIn8Zh6C4ApCSCXELEY853m
	 XQ/z/0kjSOCx/fln1oICU6pCeFPtFLTTKw7KHZIH86ckxpWmVcpcJrTZpSasZLcgGBabF
	 6YvmFgz9wl7LQlMu3tZswLNUM3cXq/9SOw1Z3PK7J96YjKICdmOPgisDB1WIyfmQpCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="NIe/bcXL";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ggIRWTWj;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65AD606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:03:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D65AD606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NIe/bcXL;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ggIRWTWj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795100588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wnQjVTvQ1FdNEd5V/022XTlNbc2cMP/Jpaz5K1hV8Gc=;
	b=NIe/bcXLoOsiLBhzNsddS0BOpTzCDGZJI78Ftb85yhXJI8QgJZsyNTPzoWI139dKs0SwJE
	OuJZv2qpEzfQCA79LXxsQMaAYx/547L+cmBWJbuF66qLSt+re19Q/qf4HgA4iHBIkWV4Oe
	CVAa1rvH3hayoYolSmrtVMqPQMr4TRk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-lAENAe7DMcaUMS2j3URPqA-1; Thu, 19 Nov 2026 10:03:05 -0500
X-MC-Unique: lAENAe7DMcaUMS2j3URPqA-1
X-Mimecast-MFC-AGG-ID: lAENAe7DMcaUMS2j3URPqA_1795100585
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4ba078abd78so17587795e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795100584; x=1795705384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wnQjVTvQ1FdNEd5V/022XTlNbc2cMP/Jpaz5K1hV8Gc=;
        b=ggIRWTWjIyjtQGlFj1zLr/5Wj/VtHpEyaD6RXTFgmB5IQKjR5URhSiL3rFvYQJc31T
         Vd5KpwQZyDTx9X6gcP9k1cAkHCgDUUMYdBjPpyQc3qVTPj+uquf7+MA3V5NVPNLvfvmk
         Pir1KM9WszC+njKJGG8Uq4QbBRafxcWekzME+ErIbSX5l/wi40eaOpf0C+TuqmX/TwRg
         jmEfGmbEGaYqs8PznAeBIAbGWw3pYzJd9REqpKHPAqcWOU6Dc7VYykOg/jiuYB4ifpwg
         MvT7VyqcCi4QCBjFzolohCc9psn1QFVmv/8vC0ZldYXR4Fpj3s/AeRuDf89HRShsqi+U
         2vMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100584; x=1795705384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wnQjVTvQ1FdNEd5V/022XTlNbc2cMP/Jpaz5K1hV8Gc=;
        b=Z8aysuTEj4lUkp99nwUrNTHZbDPZdUxwEoC98qUtdT6RUW4Xlhu1sbH5D/5NAUQMXY
         JV55mBxWXwAC4AzRGFk65QU50BUR0NrV4l8JwvIGWyPWdw9DZwA43fAjKywIAOzEMzd8
         uAjUyeeNNj42WRFAw5cUA7kkcIeUav9tbF8qIPZMFh8bV32W/UD42oZoBKDPPfb8eCW4
         NPxeAnbANwNiiWXw+yocxPPGpvrMfAFnGyP59/U3Uv8Tx71QrlrK3eVdmsuRs5xw7GYb
         gzqQX25Q0x/ODT6s+HE0dZG8X1d5UnwODsTrq1rpugkB0dV4xTK5NAWKVzgs8iDlFDxx
         Rkjw==
X-Forwarded-Encrypted: i=1; AL+hErEkZoRCsrXo9unIqFgT3JFoKsKIzyILTOoN2mNpFYBpGOaFWVUzLUh4UgS8WIBMEuBXHRiLSj2VQKzNlk4=@vger.kernel.org
X-Gm-Message-State: APuU4Z85YmrJNXueuHjVG2EMheD+gngUb59Xeo1bVhX0ZpKkprx2rwjS
	UuZCbriyuYE6xWh5ylSiKJwoqm6HMlGoYuxR/whirADrKZAtaWXycM1v94WX638Ye1VdSKpBxc/
	u+66flceiOlLjoLA0a+cJz/zp685H8DLr3mWC/zahw5q+6IKIJTmyaFJ9kDHDp+z9fg==
X-Gm-Gg: AYBFou15W1INdEiN2bn0Mutlraq9/3SI05s9Q43xUlz1f8IhXiqGem6n+Ff7evC3U5g
	2n4dWErdgAtmbjMECSgxz2EHzGMFVNPudXp4ei3z0Xm8b+kp6MISUxRJFWgQRS2KAhciPF1Wwv5
	94+0HfS7Hvk6zZk16plFrRsdzv2qnkhI1Sga4+GIhvm9eQ0erH81MiLXXDEATnU056hmM+30rpb
	xEdFxDwW9EqTaQUcNZhV8DAfCxhnyRU0998o+3H5PGaZcV7XgIRLTq2b/Obya0sNOWvA7QHBl+F
	h9CHe3A8TROwfFdV70zlrRaMoa+YP07VLBdtSkGdgA5lnqUCIYMuomsB8oXKeGd9AzimY+d5RL7
	ZkXEX2qs1oddUi4mRUBKXkfaGXLLr7+xXob3JDwFtwQ==
X-Received: by 2002:a05:600c:34d2:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb7d6d1f21mr127466805e9.1.1795100584427;
        Thu, 19 Nov 2026 07:03:04 -0800 (PST)
X-Received: by 2002:a05:600c:34d2:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb7d6d1f21mr127465905e9.1.1795100583800;
        Thu, 19 Nov 2026 07:03:03 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1522:6500:ac93:c62:f076:48c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm2590845e9.15.2026.11.19.07.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:03:02 -0800 (PST)
Date: Thu, 19 Nov 2026 10:03:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Xiong Weimin <xiongweimin@kylinos.cn>,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] vdpa: alibaba: fix typos in comment
Message-ID: <20261119100226-mutt-send-email-mst@kernel.org>
References: <20261102043526-mutt-send-email-mst@kernel.org>
 <cover.1793860522.git.hemanth.selam@gmail.com>
 <e68b7938e19affe2b18ba0ba9711e079fe1f7084.1793860522.git.hemanth.selam@gmail.com>
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
In-Reply-To: <e68b7938e19affe2b18ba0ba9711e079fe1f7084.1793860522.git.hemanth.selam@gmail.com>

On Thu, Nov 05, 2026 at 12:06:53PM +0530, Hemanth Selam wrote:
> The comment above eni_vdpa_set_vq_state() misspells "specification",
> and "ENI is build upon" should be "built".
> 
> Link: https://lore.kernel.org/all/20261102043526-mutt-send-email-mst@kernel.org/
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/vdpa/alibaba/eni_vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vdpa/alibaba/eni_vdpa.c b/drivers/vdpa/alibaba/eni_vdpa.c
> index 1288402d3dd8..af163b4f9259 100644
> --- a/drivers/vdpa/alibaba/eni_vdpa.c
> +++ b/drivers/vdpa/alibaba/eni_vdpa.c
> @@ -276,7 +276,7 @@ static int eni_vdpa_set_vq_state(struct vdpa_device *vdpa, u16 qid,
>  	struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
>  	const struct vdpa_vq_state_split *split = &state->split;
>  
> -	/* ENI is build upon virtio-pci specfication which not support
> +	/* ENI is built upon virtio-pci specification which not support
>  	 * to set state of virtqueue.


which does not support a way

> But if the state is equal to the
>  	 * device initial state by chance, we can let it go.
>  	 */
> -- 
> 2.48.1

