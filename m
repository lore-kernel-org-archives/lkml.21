Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196475;
	b=ybHGDorYDkFqIwMtLcvmJuC4dOO/NbYX7Tp5TOJWcQytkTaBFuFEOlSTQ0oNOIXqyIBh
	 x/dKvOWDOdiaJh0nWg7qriQI2lqduZKAAv8Z92EDvqJhfN0+z6eIxpTaBiC+w5i23Xkpt
	 j/9XmJWMYaGn7st6Up3450Qcs62OnqmUD1qav2v7fuyLHfky7uo978QCTcjwe1NNjGkay
	 qcZMJZYog9uyh+REHhk2dsLEtj5KTvYAHbqhdpvNkWEgFK+cCrSfuvII0OtFZGuZQU5lh
	 8zeQcq+xqjFlY+rR817N0+zDEoHFXWxByHzVGoutco9NnKxs6ceKxZLlIA3EAUQpFpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196475;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=QxicgZnWmONMFfNmMAto/ySXQClWcirD3FZcjmpekDj9Cr4PjIxVXrjxqeCsD+YO89UZ
	 1TNw/KTJTUQnO7sXY7k7oIp/z8vfVr8cKTxvLnXKZefDXXtwdbDjYFTTjt5s7iFFWGVQ8
	 imm/U9zluQbh6gZR0FB/Fq3B2x93IiOwIxMa2oiWZ1Jl0SLPMPmn0utFJC8B4qcv/BBOU
	 jt10C6VgjFdB56ct0bq/uylGUk05iyOMkxUfXUeHDjCoS5UyARAN/7uvnKUHt02KnhHjv
	 NUQepuztKrA+ZWvzPxGD2qD7h5MwmRvdXMpKPOy3EbObC2ZGR8HKHBd5gkaXS7g97Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bp7k6tR3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A159606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bp7k6tR3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15161F000E1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795196474;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; h=Date:From:To;
	b=bp7k6tR3N0DmPb9mBp5OfuhNNS566qKDQDoCtVM6Mlbd2yv2DDb6g5O5gcn9EoQqF
	 93ka+OAOZ4mlDkP3HN/clO2TvK0qdIYWTZlmuMcEne4upkihbkf9SgpLf1lCjxq5eG
	 f5zD6zms6pxitrO726bj0rB9EiVy1QP3+N/aof18zeDQSn9UDl+4f7HJ7mylBUtyz5
	 W2jC39lLLCp1x1/hmwDQWlwmtRLpIlaUed1zZOVL/Qwb4mbgRY/wl8thDKHqaovxys
	 pZvGmX7sjWOWGOMbyNjuqZ/G4xTY2eS5E3gL85PeNGo+r+Iit7YsqHf/2/TyFMdbaJ
	 iv1Yi1sQoIOIQ==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xUSbq-00000004aEB-0KK7
	for linux-kernel@vger.kernel.org;
	Fri, 20 Nov 2026 12:41:14 -0500
Message-ID: <20261120173852.687189370@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 20 Nov 2026 12:38:52 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

