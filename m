Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543252;
	b=4Ja56qY49jIMf+f0Lkw8qT2ITGMNmMO3SrbdK5+R1dVM+jF0Nr7kx8vwSDa1uX+tJuJj
	 vLjIcUCB7clL2AcJQ1PtevqvMM9k8Vfq/vCpVQyDvS0gYYdq7HuOtF9xZcTH9za8R1TMB
	 o4zrWVMqhdQmOLPceV9fA5Uv7JQlDH2UXmmD+nz8R1D3FHXnrnhmnPHid8KMMeRv0Qpsa
	 GLAMn094ug9XNmAA31jz1/6cM86sz9jlHbw73Lkn6TJcAEcYHUlc0aHD7oTF3m4sSLJwz
	 nZbRXW78/pO5XoAoBIajUnpvb5z3YgDjLVlluQ+F30e0rlDq0dT7f07ybrGkFqq0U4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543252;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=FBEp+8epSZbnBEYjDF/iU0fcUTP9S0egShLX5gq4Fg0=;
	b=xzN9Bdaq9fEW6JdawDzkpbo62QkPQQhJcOZXzommNCa7IeSMQkSWp8x3iyM1jd6tE0wY
	 Im6OHmlDf064DILZMFEbm7XB/8qHAndmSR0h/8wVtM9Hz/yezkGTUcxv2PbBUyx+Q82wL
	 K+SBb2C1gzsQhACbZc0XBHCA9H966Nnpd14pjV/QXpl58d6UUoGBqTYvyaCzfZONCdtYn
	 DezzSE+ox+n9QL+FGoqB1509IIQ2xP0dMmSgBzZIUUwWeUPJ+ZRSFBb3zzWHQYpgrMkgz
	 Gr8BoBmoGpt3nnzrHPgtQS5iwOGi9J+E+U2syFKNI5RAko20/tmB0xj+eUGQoAheu+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=cxL5f87t;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=3JsH6CTw;
	arc=none smtp.remote-ip=202.12.124.148
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC61606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AC61606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=cxL5f87t;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=3JsH6CTw
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id E46461D005F6
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:00:50 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Tue, 24 Nov 2026 13:00:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795543250;
	 x=1795629650; bh=FBEp+8epSZbnBEYjDF/iU0fcUTP9S0egShLX5gq4Fg0=; b=
	cxL5f87tD93PM6iTwx/ID3wRKLndhZAvlqy4RizYBLcaxIbYZ2u7xlTA/+tJptoz
	Ef8Hcod1x6cywby9QmXyoPT8Tovh4iKkXpFUQMt/EWyszL83+HLe6EO3qhMJ8hlT
	L8n32oaGMkgAAMMl4/nDcr3EMXkMnO1YYnucDls8mocB/gJW1it2nkKvp9YW4IV3
	YAEdPBhLNoNyQqO/dBnAREXtXjfchV3rPg5KpqoL2xAL6C8dlEBP3xePse1wyUdf
	R4bRH2w4KB5MZTqziC82nbvxUXg8iRizE/p7C5w7piL1uYNwRTCjcAcdkkRWjBLL
	Vb5W8Mu7vFkC2DStezpZ/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795543250; x=
	1795629650; bh=FBEp+8epSZbnBEYjDF/iU0fcUTP9S0egShLX5gq4Fg0=; b=3
	JsH6CTwU5Kdf4EO/8eSeyH8Cp7BvA42Pd7bb0aF+zfnGBwGP5jQU378FFH92v6tz
	+vdPxvIdaLcCY0P1DWqhXLH7DD3Xi2yV9DPOoCcJlHPqKDDDs0LoLpChangzDhxD
	cztD5EXXZRefjbwH/1zGRWLNRHuODJ02BcpYrrqk+V5w4ff60IvbwAF9ZmFh85nz
	sRDBR28wRT1AXkCokBAy3ua50V/DLw+xZY32Nhpx3p6xSVChVVmpC6/dXz0ZNXLS
	POvOJOEpWaa8618WHIjFkNHlpnolBJLk0mo1qqm22jTK8rDWaMxttE7lX8cMduuw
	PCj1D0nNuZrk21vZRwrlw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795543250; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:k1jlDKw1tqUoMksYlQ6Un724dp4fBvQnH3QkQ/cnZGbBZe7
	5zIx3VsHLo/0k107Z/M4UYpnsT9JfPpxK+ejQ7dsr+ejRSu41PfN7Fqi0nb0alia
	7QfABECyc0KUOEdm6fJ0E1oDz4OHsTi8ktAt7GIexQxeKjw1KG0kVN4aZ51htDvP
	1YuYbwJ0L/+GQx15hyecDLJqZHuEjNA55ti3JLlorN9i6Aa+IbH4oItpE6GfLIJK
	xnV2jw6lNe4w50+lqz2IlSYnvisaTp3T9eiO0KQyRcBQw7FnESGSFS1o5xqCcBQS
	FLiWtNbgxyaPlT6M1g6wdRXNNnaXudngPIfU6RQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Q7U4h3D6eG11vM44QGkD+40b6c5bFN6q0MA+b5JCchI=:hKNTHTa+AxgtA0QdIvDGfFoGqi79K1NXiQhb/TbYj2g=;
X-ME-Sender: <xms:0dAFa9pxMT5OhsBOwRu9Ma9XzbzN5S-V1ic7D0RFQ930QSixLIEa7A>
    <xme:0dAFa6cp3sP0cB0mDyUDBMVu96foqSvbNDIY9vXjzjzBavYiJQ5hfdX8qXKi8e3JK
    5SHTSPgz_vPrdIhQAurD-1IJFjCXK_QE7iZ7BTxNrAhFm1slJvU9xUE>
X-ME-Proxy-Cause: dmFkZTEm/iC9G/ls5AwymuqfOXpm63Qg4DVEotXnOP3r+83ztVCEwF+zN21mTGp4D+7KUO
    QAkXg3CueB/gO9TECUyfxvk5eoxJOBBwJcGbrrV2Wa9UL3G94UTITLZv7GDONL26tztqCX
    dG0nG62CYStkrCaOvXO44okBo4APzjeSd3WsZzifLB7sHj23tS2ysvHkxlhZJplif+s49j
    1OzrEJhjIvL6q1xfjh/yjXyRf/AayhivS3/8bT0K4K1JYcmfXYc62BIY4WRSxNdQ4exlIJ
    +10f5pC1OmelT7Ybw0LZBZ9JBxZcjZERcKYHlSaXDWwqnaOvPAn3yEgIGs5XbIcRqb2qOi
    PiaK0qEqsXTHNf432JP49Q0jdrr/gxxMMLqZ2PbATWfoBI//M5ErYeXoQ9QaU7ekPu/OST
    gRJK/ioP/2K4PaU5eTlIKVA7soddG1NvBHjwWcWH0fvHAxns5b5q9xOFKVkYIwiov2oFCJ
    JsdieDQNSIYlNPsCMqgEuQuLsEkJSHnwRohBwAgc03YXvGjOlBnEAjMRnKjl+z+nFssnTm
    G4h1zSofJam5Mgi3n6LQyGAaBWEslZ1gBBy81Pr5IeG1otBK2izFdov5J9UDQy515wgadc
    Ifhpw2o7NcMiVi/TgCf79uWkjQtfpKHWmdrIgRdKklMwQW+Mm2/NIduQ+v2w
X-ME-Proxy: <xmx:0dAFa5L_lexSkXIxXpiHh3rcm1jYnFIgja7xknDGVBryZqvsVmf5RA>
    <xmx:0dAFa4P-h-Y0hx46S9XJI0bd5oJr14e_lPNRvXCHsC290AZqXHCPUQ>
    <xmx:0dAFa8Xncu0K1sIBKHwqt3IY2yet9FBZzIBd22fxMq-Su26IKdsQww>
    <xmx:0dAFa2kkxq7YUIrj3hp38L7OM9UJh3KtCiwYbvy_LC9SxGcCjY_E7g>
    <xmx:0tAFa2VIchIMHDvvPdWSMlgVW_xQCo-M0NN21nT8hEEnmhllD2u1g_hf>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 9279F2C00085; Tue, 24 Nov 2026 13:00:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AfY4cavotJas
Date: Tue, 24 Nov 2026 13:00:29 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Tom Hu" <huxiaoying@kylinos.cn>, linux-kernel@vger.kernel.org
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 xiaoying_hu@126.com
Message-Id: <6066c701-55c8-494f-9348-f9835b258b44@app.fastmail.com>
In-Reply-To: <20261124103946.897642-2-huxiaoying@kylinos.cn>
References: <20261124103946.897642-1-huxiaoying@kylinos.cn>
 <20261124103946.897642-2-huxiaoying@kylinos.cn>
Subject: Re: [PATCH 2/2] platform/x86: thinkpad_acpi: Only check charge_start against a
 known charge_stop
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Tue, Nov 24, 2026, at 5:39 AM, Tom Hu wrote:
> From: huxiaoying <huxiaoying@kylinos.cn>
>
> When the EC does not provide GET_STOP, stop_support stays clear and the
> cached charge_stop is never probed, so it remains 0.  charge_start is
> still validated against that value, which rejects every level above 0
> even though the start threshold is supported.
>
> Only apply the cross check when the stop threshold is supported.
>
> Signed-off-by: huxiaoying <huxiaoying@kylinos.cn>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 8fc5569131f6..842045272ffa 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -9832,7 +9832,8 @@ static ssize_t tpacpi_battery_store(int what,
>  		/* valid values are [0, 99] */
>  		if (value > 99)
>  			return -EINVAL;
> -		if (value > battery_info.batteries[battery].charge_stop)
> +		if (battery_info.batteries[battery].stop_support &&
> +		    value > battery_info.batteries[battery].charge_stop)
>  			return -EINVAL;
>  		if (tpacpi_battery_set(THRESHOLD_START, battery, value))
>  			return -ENODEV;
> -- 

Looks good to me.
Out of curiousity - have you seen this happen on any actual HW? If you did I think it would be a FW bug as having a start threshold and not a stop threshold would be definitely odd.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
