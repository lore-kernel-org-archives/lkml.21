Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795318550;
	b=h9PP3+ea1YP+/Q5gA7gyeDB5sSNGw/7YiZaHZoY0PLaBgJWhpZmWs3MzS7UWTISHngHF
	 LZBTnGrrL5gHfkwNVF70i9xRVyXtnHRc/3jk88iWlzhICNKsQM1wMw2unzAhAQy7l/94d
	 jKsXfM3odziJvlBft+m5cbcyjI9uvIZaj97kW50nuuOvB+JXl2JEkSDAkGXwAS2mtsgNw
	 8oc0dfE4iPA0IfVr+hL7uUQfqs+482sdYKpeXovoJCjx0nUTZjQCsdWaC1l63QlddNK7M
	 Dicryt2XFqCC2G5sL2lPOsblSSSInoXnm83gjiFWIXe/yypcyTt150Txn6GMYD86KbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795318550;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QSgaREyZYRe86KM5i9lr2iPL+fByfIkcgYjg5NhPX3I=;
	b=xhHVoiAZGyFDO7cPTvktq9K6TEUEq+FuvA7X4QmVZFOsAWBaRr0k0gOFujgrT+ku5x2x
	 kxASF+Er7WJs75GS4ftL/cZEEcSQqMUi6E0iLTD4UcLo0ofNTjHe9Lx/UIhtU0aspFQ4A
	 iDJKZ5GUT+vjJWAN4WhjZtL1X5LjW94qYQeERs1yir3DW/YjgW8JyjWWnJQ4SgHs6AH+j
	 uq8vC+a9GL7k1T3jmW2lRF1JLC66A3LfIzs/0x/ZIdewIPyOF7yjIs+GIv0euQ+VrMJJ3
	 jFPufn955Yfu4SmKMwhKHZ1ipaImU+cFGVWt+nnVsTRvpfm6PPzbQ63G7HOUVQ96fow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iKNJOuj4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451BC606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iKNJOuj4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CA81F000C4;
	Sun, 22 Nov 2026 03:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795318549;
	bh=QSgaREyZYRe86KM5i9lr2iPL+fByfIkcgYjg5NhPX3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iKNJOuj4thlqwU+f26YOzf0hkRJJTktOG/ss23cd48YhYqxPR1wivp60L4hm1rW8w
	 4xqbTKRRn02l2BtPsfg5b5EHg817JKKwygEZqJWr8TGeBZbfOnIzNjcq1RXGQv3vIy
	 Y3VPmB14o53YVnHUn26VD24bKNpxxhCqIedtCaqgGTGbtsFy/b/Dq2eQbd9Bvnt5KT
	 I8fxVlpBmRnh1E2GG9jvGi1jbxKovjxmxoIBDsEs7KhLDPPxAu3H2tzjzJQvylpWkc
	 B7EadywXcqcq9kIx2ubGL2cIVMYuWrXNNSfYk/GX/TU6oGuDHImf5ZmPgtG3Anb/qD
	 Q3PobNV2gzPqA==
Date: Sat, 21 Nov 2026 19:35:48 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, leitao@debian.org, 
	keescook@chromium.org, hpa@zytor.com
Subject: Re: [PATCH 4/6] x86_64/entry: Mark all syscalls __noendbr
Message-ID: <awJici0q46X1HJqS@jpoimboe>
References: <20261102112549.714541309@infradead.org>
 <20261102114000.771366690@infradead.org>
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
In-Reply-To: <20261102114000.771366690@infradead.org>

On Mon, Nov 02, 2026 at 12:25:53PM +0100, Peter Zijlstra wrote:
>  #define __SYS_STUB0(abi, name)						\
> -	long __##abi##_##name(const struct pt_regs *regs);		\
> +	long __noendbr __##abi##_##name(const struct pt_regs *regs);	\
>  	ALLOW_ERROR_INJECTION(__##abi##_##name, ERRNO);			\
> -	long __##abi##_##name(const struct pt_regs *regs)		\
> +	long __noendbr __##abi##_##name(const struct pt_regs *regs)	\
>  		__alias(__do_##name);

This is an alias, the actual __do_##name() also needs __noendbr.

-- 
Josh
