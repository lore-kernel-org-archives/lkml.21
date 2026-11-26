Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693564;
	b=IBO2B3Rv9ee/dX0k8xmspQElrt9GC8fvr3KAZ5U+Sq3Lzv3/OfxVXP03ltYtrca1sROl
	 NoKRr7ElETIAuiOBlD6yPGmycgUnQ/KbabJjaEtafkKF/Rm8/ITTwO7Lic7dTND0vj6xY
	 ZRaZoA92HEQfTcKcso7pDrduXF5XyARliHOiS4XpYbOlxKaUu2XUJQ2ng5DrSkFA9XXwm
	 c3IOjv85FCsmaFwtXzKY3OFOeDxzxar0bs2LmbZJ06XnTzvlK4k3FCjwVpIXDOJ5nxhtL
	 0fPYlmBF/BYYGR4mZtbk4zrsqFQvtakLGIOZ/Uqw+OxGyEUT3ZpQF189ASzeIrkNq6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693564;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SuAWMmZdzveERe5wGAvKIhuET3HUUjSDoRGpZWpoiN4=;
	b=FUMVtsnImskXxfHI69nXFGwWaotR3mOE4zPXNu0hbxq8GssDKGVZCyH27P/adabbAzdZ
	 awZ+b9CiVBM6M73ap8VC88KPquhsHMhGf4Uwbghx790pmZM/xRhkVr9C+bMicLNexqP+G
	 8L5BlnamsuC6CJiO0rt0hob23I5xWC6BHU6ETr6dCmxyFNi+6KIMTESK2H1eVI6n8/eNP
	 e9m5aCQtrm3OlfiUpjtB5n/fUJl4rP45L/cbTbxovrvX6gA2rYC0iiFRWgxbDm9tScMHc
	 Hhhz0iTRIfjefFQebfis6k7IQJ9x4nRxzQjab3uf7JP5QYjS+S2rn+J/tIxWtWsdcnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UVTmWd+T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753FF606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UVTmWd+T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241731F000D4;
	Thu, 26 Nov 2026 11:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795693564;
	bh=SuAWMmZdzveERe5wGAvKIhuET3HUUjSDoRGpZWpoiN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UVTmWd+TjuqmNcuaD+3/boezFDT3Nb6MZaU90+QdbhN/8bMRCxpwD+LvHpSYkK3u0
	 rmkBKsswjbVOYtPNYUmksxY/x1xDKhTP0DjoX0YTId+v15cdlErKYzgnD9fhSac0A8
	 K2jBDxZeemK7Cic3hbqSyJc95cJwounTOi3gdv1xJoxCWZQKlk62WSE+KHafJAEL1E
	 VLlUIW688QTgH8HF1U7gcJzZLZZ1VUOpK0Nrh7gzSdrT2n9OpvedTGq8dyxovrusa8
	 UXxbPxgaFRq7jydsOcqX2Qw7z8M2Ro8Dx4TJvbPdGcVc4bQjoUGdTa69xUp7EMnRi6
	 s7ahSM5UYJCkg==
From: Mike Rapoport <rppt@kernel.org>
To: pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	Xiaotao Zeng <zengxiaotao@kylinos.cn>
Cc: Mike Rapoport <rppt@kernel.org>,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	duanchenghao@kylinos.cn
Subject: Re: [PATCH] liveupdate: drop redundant lower-bound check in luo_session_ioctl
Date: Thu, 26 Nov 2026 13:45:57 +0200
Message-ID: <179569355390.4110848.12568494599034735951.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120075252.684604-1-zengxiaotao@kylinos.cn>
References: <20261120075252.684604-1-zengxiaotao@kylinos.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Mike Rapoport (Microsoft) <rppt@kernel.org>

On Fri, 20 Nov 2026 15:52:52 +0800, Xiaotao Zeng wrote:
> nr is unsigned, so for cmd values below LIVEUPDATE_CMD_SESSION_BASE the
> subtraction nr - LIVEUPDATE_CMD_SESSION_BASE wraps to a large value that
> is already rejected by the ARRAY_SIZE() upper-bound check. The lower
> bound test is therefore redundant.
> 
> Drop it so the check matches the one in luo_ioctl().
> 
> [...]

Applied to liveupdate-7.5 branch of liveupdate/linux.git tree, thanks!

[1/1] liveupdate: drop redundant lower-bound check in luo_session_ioctl
      commit: cba589505b0ec93075c6b17abf502a777f034133

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: liveupdate-7.5

--
Sincerely yours,
Mike.

