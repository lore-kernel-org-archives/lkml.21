Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969674;
	b=q/d+NqTEwfLKVJK207JCbjFeXujIWG58J4+SBRH2Z/SlkdURX3QJusMub+m3hmHWqe9p
	 0X7njoyjBu2+rFFiuePhe6OoofHXgR8CwQ/QX3ZfEGudEuJbEAQYiGRNm/DFUjxG178zE
	 iyTDaiXSvY5GJ4AH9APwooMcp79o/JSjEuwI3k1/iB8jIz1VhQti4yvJFJlS+OIgY5tQG
	 BDnCPp1kUd2Ovj8DGDmsB+5W4ShXMTD/NYdFBuq4FmilXwI6V/2CJy6D8sWpUNz3Drgcp
	 J6d0ePu3Ri6ePnEHeoM9LqywrPBfQwVwxnRdBP32yfweBAWgJi67moZKR4+z6pLqa9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969674;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:From:
	 Content-Language:To:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=YMqOGT3MjcC3nQRptIcEAaa3EXNPCJFAg8JEY31Ow8Y=;
	b=3M8fVdNIPw8JZC0xhOWSCQwdn/1N3AKcmq10G2/xdScVZubEN5i1SrkAcLnnp1+LTaLz
	 pK0+TvDqP/gsT6Du4pJzuq0hVzntAms7s29CMIbrKdj4kWZ+8THCgJdxZkEgsd6LATtbJ
	 IQJB4iiEV5lgFpYOD3SSXODsBsm2FkYH1LJTAwgdSiRT1lFX+2c5aGQCC4KkqjN99MW0V
	 RjEjeRJguPv0PJkUQQtFlEE0DdwYMraeUZSptOs7UKuJBB6YbQOQ4Qdt/IHNYhlRqw7cG
	 rOIg5vebLfdd3nBaB5ID5Q9TXgdArDzGbLxzYR3MldHIE/gi/hnT3w1Ww12y82Zzzug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AAmhAhLl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0DD606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AAmhAhLl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64881F000C5;
	Wed, 18 Nov 2026 02:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794969674;
	bh=YMqOGT3MjcC3nQRptIcEAaa3EXNPCJFAg8JEY31Ow8Y=;
	h=Date:From:To:Cc:Subject;
	b=AAmhAhLlRnDDMtI8DH9jmgWbXXRQSTjtRUmNzcbv+N4joGbc1CsAW219IlF0dF+uS
	 2TSTLQQfGFm4FvCGWFZemJtq6DRoqTJtkD1k2KDUindfzG2cIJ1oazO1/U8WnZs0/o
	 vcK8K7vhajrmJL+7VORWO7CJmfPlSTvHXh/kdRaAFSr626+gW5UMBD4jAogi5Ay+yq
	 N6OFlYCq8NC0MwoGve2EtyFig/Clk2bVl9f8avxNv/uiJQNW2qGgQ2L8ML4ZmUauX2
	 JCE1QDeWy7cOTO1/P9UvbCQAnXF/osN0NsHHifYT1TnRljBI8fotfMLwFmQoqkaS3I
	 1wttlk9cTcVrQ==
Message-ID: <62e47ef1-060f-41a2-b7f4-5c80a5c2f7d9@kernel.org>
Date: Tue, 17 Nov 2026 18:41:12 -0800
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
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Michiel Derhaeg <michiel@derhaeg.be>
Subject: [GIT PULL] ARC fixes for 7.4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Linus,

Workaround for a long standing issue with ARC, please pull !

Thx,
-Vineet

--->
The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:

   Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ 
tags/arc-fixes-7.4

for you to fetch changes up to 603b4fd69b4e77770761ea03451e2164186f8590:

   ARC: io: work around GCC PR127718 in __raw_write{w,l}() (2026-11-13 
21:21:13 -0800)

----------------------------------------------------------------
ARC fix for 7.4

  - workaround a GCC bug which has been causing upstream build fails

----------------------------------------------------------------
Vineet Gupta (1):
       ARC: io: work around GCC PR127718 in __raw_write{w,l}()

  arch/arc/include/asm/io.h | 13 +++++++++----
  1 file changed, 9 insertions(+), 4 deletions(-)
