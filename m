Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969036;
	b=MYCZ/B/B3GKUmGJ4tGJwNbv9drxVqmxoFOtNa0SdIup1iy448RK3IfhcYRIhuBhJVOV6
	 zsXwZdjo0yLI50k1u0t7qi3WmBWs98wxNs6zErxXhGYF2QAyJ7y1k5x6IVQiZ9mhBtMcM
	 OUI2F3L4XQFnT3gVyXXexYvN0hIDLbU//QEXwXoQT3f1Z55MICcZEbfAH9Gy/4tDBYJ4T
	 KHna0VNOl1vxCSB7Cud2w+Je8PwqsL7N1I1ALMZp7Bqq029sZKc6hlDK4pUloOuAtmC/1
	 NsS+tdEMK5zCn5gG3VW3r03/+JCefQlSxG7tcN57vP4r15nk48OICnWEeuLCDqkcM5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969036;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qJEhhR5/6tKN8LDHSKveNcLWXyTwd2lpQyvo6+6BPCs=;
	b=yqTujU7NB/ULWIUCAqJ+WXn8mJAUReCYLeRJiU6IK4A51Sz0Plm3q+ve08T7uXGRadVe
	 MkYxF8kNS4H107Bh8UxEJf9mqZJhzgTTHnq20Bxp0rubZ3rGc5ClGHA5b90CQ2M+WKLvk
	 Pvq8aR+YLLlmfJcNq4tLdATzY8RtfGNNkdmP+SWbfD1m+a6uTi9KyzFvYwBDlywA0F9tw
	 ZRsftixZJDcpZaGGzXj8LdeWHSiJXV57urcPDnnUdUwJiDVb0FHQff8cRbRaly6nGXOpP
	 RRWeaaX3jdlqJqOmj4v5HP6eTZI54Z4lLPLDFKYxYb5yUnsrrJsO63BTtbyEYS6h92Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RzifPs+u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A3B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RzifPs+u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092E31F000C4;
	Wed, 18 Nov 2026 02:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794969036;
	bh=qJEhhR5/6tKN8LDHSKveNcLWXyTwd2lpQyvo6+6BPCs=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=RzifPs+ueb3I337mdPVbWjVOFU3xOKzzDV0AgrLMSU+WKEqoaKrf6ETrTYUt3tXAc
	 2mOQlKwikjBtMhZ/MW8nPnPGCbjWWz1Vla1TsKhkIQWNGWF7uTY2z6ON/dXeXsJY0E
	 R2DiTIPcRhyE1OcqnunOTdS1sVzHXzKzM9msp3Qs27PvWxhea3nyR8IkD6MuuY3qcT
	 ZHi18C3uskU9gUESPSa4/IZyPDTbR4qdGBzbL81qwS4XSZVg507oCJhfU5E75g86+y
	 N5lwU6F5hnBQmxAn0YSNFEaLX4JaBlJ/MXmdSYvUKdle2S932HwR5TwoiCr105EqJ3
	 3LLISeH1gPbgA==
Message-ID: <f5c7a29a-d751-4db1-a054-22e31386c3a8@kernel.org>
Date: Wed, 18 Nov 2026 10:30:33 +0800
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
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2 19/20] f2fs: count compress cache entries in
 pages for its memory limit
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261116040851.2849696-1-daeho43@gmail.com>
 <20261116040851.2849696-20-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261116040851.2849696-20-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> The compress cache holds one filesystem block per entry, but
> f2fs_available_free_memory() compares the number of entries with a
> percentage of free memory counted in pages. With subpage blocks, this
> limits the compress cache to a fraction (block size / PAGE_SIZE) of
> the memory that compress_percent allows. Convert the entry count to
> pages before the comparison.
> 
> No functional change when the block size equals PAGE_SIZE.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
