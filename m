Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745669;
	b=V6Cq8Z8IxKh+2IOtnoWFPimjwg9C2lhASdk1me4dY/m/ZEWBqZCZZNbsZbCetoZEk7yb
	 zdsZFt10DaMuCOL/bXArCO5g9hdtEy40E8GH1gafrGgKame5zlIk3XpeyU1N3JTjoJCGM
	 Fq1VftITYvafAtlwnhESEILYW/aUVj9PGog/9R2mQYX+GfhOjbiuwgQGso+7pgaeNdvIr
	 MuG5SaYaGam3Q7TjKyzCZhYBIaKZDa80Df+qSiFN/Rm3E6oPFb5WNZPK7H4w80CHVuXdV
	 6Ai5pIucDEthCUCAhuCgWV+EhlQtrax0Pk6fJ1sBuosamztDqWSi3oZBIVWcRZ1kw/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4UeH+SqQT+FD9wlg8cp1/QgsPN9k+lyc/4UIeCKdJoE=;
	b=BIoUWhONW7kCjr2l96tGDd/NmTM9xA5g19+j8gJod5EO6J7jcS6B7+mL7pyRThnTFM4a
	 rFRT4UE28DczQMyLgHlwZE0R/6Fr2IQ9IrRc7jtpkWsKf5qBagEpjhjMhpnbrzKP2hZj8
	 ICCZ0CKSroIBW1wbIIVP4+f7YzGE9U6PLByhjOUX6gP+panI2CoHRLniWYHS+hwV2H4cw
	 vjw3Yd5cJKgOvZ0Kt3idn2vrKbPbKvXil3VG6sHtA3n7Cb6wzzC/InrnCkWm8cBzGF3Zw
	 vdY1xAV0TS0zpamqkSZBGLtExlkep+m6IwcHeLUrNRjQpVqQ8+9WQYg6n9NulchIu5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pZt1UIIs;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E177C606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E177C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pZt1UIIs
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a07078200fso4017816b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745668; x=1796350468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4UeH+SqQT+FD9wlg8cp1/QgsPN9k+lyc/4UIeCKdJoE=;
        b=pZt1UIIs3XyYpJfZbWph3GHoe/PfYxb6o6lRdu4jNphswYo6syX1siGfHrMdOPpNqx
         BaBsqZF1oO0iQHN9aj0KFlV9PxJkvxHuqoBViJD2Q2UJ5xH0ckszCX4OYQ5E3uiW2OzU
         Hk/wcPH7GYUrfVeYtCR/8ueWiTy2P3bypN5y+uDs8WAfjuLpodUC9YPhk0mnXDcF8lug
         5BpFz81C687p8k9ah3QrtTmcHquTBGemjEUg3j+AnxYWKuybVjnJ+TcqIb8LFCfp87Zm
         f+1Atxb5he18hwX2gAKSg8sxV9ykuhWC9W7hkcEYLMT5JphtKFL4LKETGk3rKn0IF7qb
         gIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745668; x=1796350468;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4UeH+SqQT+FD9wlg8cp1/QgsPN9k+lyc/4UIeCKdJoE=;
        b=ecJ86ItzhQEwuoywdEzWJ9VQY6dgHurImxnPZbAY3JfTAWNQdjlFRRKBbmkaXumhmz
         eKuvobMscdOEmTJJzNkGU6c1VIdrivI993raak9DnvLhhY02+TW82TnDxTKayP+z3sBf
         apsZj1z+tC0/+jzTkfHsbJqffirE2QbfjE9E7OvFSNwjOPNHt517hbDaX2FCf9xxAQKU
         hZNQFUrVofz/Bq09POfBuhNwdwlh+urHyISR1WGBoUmZqkNtgejfyuPZXi5A+LDhIj+B
         t2Fo95oOJlVTZ3Ifvrc29ttdz6vTi+SlnSrImMqdGrQ8+iecAbuSKXUZeXF5yq9UTZvw
         f8Gw==
X-Forwarded-Encrypted: i=1; AL+hErFLlH+bfz+xx/FKeE9AH8fEigpLF4FAM7pS+V0/wzmb/i5GhPx06HpbuDQnL7XJ3shJhCRG60k1dRzUxMQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+G3kdntvpmNWURBrxDMP+H9W4yFWQm449Aa4nQOKf1XOVZ3QmP
	j5tV1CN+ciO1NT3WTRnzrlEkeS8gyU0blaq/3/FaX0n8KWWjTQ/LczgH
X-Gm-Gg: AZFdTZc6lnmk/NbUTVFtW3fehylbUm5D2GAtAilYb8+sl67XKEtXXzf5+p3PFwRT3gM
	SzWPiWvb29hC6vGitXKUohEs0II+mMdB4HfG9HHMSFs5+cFodKo/R72vZvJrTeg+PmHKKIQFc67
	90UP9+WkuZFBn51Y/8fgi1AcxjnMjB02by+COWyKCd3VKmVv4JppjT6Yg87w6K5CdGwp64X3iW6
	ZKS7UbbcV/3EME1ofLdJ9b8R63YQ8usS6MC7Lo8L2jJYCAUgDR/38bn47KOklP4FG+bccbkoBy0
	HaHAStUp8kZPDEQJkJfqCMzvE4UrTVBczpQ1O0fHTyGp1NTtaDFRVPwH4Bd30/IfOKh+VYSPzRJ
	x07tXbbP/mofd+cB1SsYB4deHa9dr10L7FN6/Z4VgtaCiO8yZI9HddWyQpOnwvU7AJcaIziEVdR
	86Gs7MMFc5lFS012BdB+pzQ2W8ph+HpcpUrkeSSiTiZW36ZSjgWi9hrohE/q1HNU6rUnWEfs5Yt
	eJuScofPdFOqgCRXJLgs+u/w7dgj92nHHAfbI4gZD+acjubgr13TCZDdv565eMvL1a70v78DrdL
	jnCqyLf+FEDgRxs35lw=
X-Received: by 2002:a05:6a21:4cc7:b0:3eb:3952:d703 with SMTP id adf61e73a8af0-4014d5625d8mr22775673637.39.1795745668234;
        Thu, 26 Nov 2026 18:14:28 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285ccf4sm11158830b3a.12.2026.11.26.18.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:14:27 -0800 (PST)
Date: Fri, 27 Nov 2026 11:14:25 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: linkinjeon@kernel.org, ernest.borowski.git@proton.me,
	liubaolin12138@163.com, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v11] ntfs: trim the sizes after a short write
Message-ID: <awjnga4nQqW-5TOM@hyunchul-PC02>
References: <20261126015731.3254689-1-zhanxusheng1024@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261126015731.3254689-1-zhanxusheng1024@gmail.com>

> -	if (ret < 0 && ret != -EIOCBQUEUED) {
> +	/*
> +	 * Both sizes were moved to end before the copy, so a short write,
> +	 * like a failed one, must take back what it did not write.
> +	 */
> +	if (ret < count && ret != -EIOCBQUEUED) {

The rollback code is quite long. Could you extract it into a seperate
fucntion?

-- 
Thanks,
Hyunchul
