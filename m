Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123205;
	b=Q7yro8efMRVoJmCiwMLppe2IFLWnTdUkyT/gHM8b3jBxwGdLJ+JymuU9AHN8rq23dNpF
	 GsrMTuLLG8Y02aJfILOBcXMvF2V4IjHyAExRvSLhUlcjiUQthKx+XCLi5Dv9mQ/QsjoaS
	 HGVYItxVFzh/M7kNRXBS4iFnrI8w9fpPEr0QHwhXAJOTkj56Ui99GCXCJAfodw+bKcLi/
	 fOTrYM7gZQwLwXOa9LHLYwaIjTM9atheuFUYieiyZ0UCpd4zpS8/b68DPMDJfzD13dySj
	 nYFGgBpeeqxfJrYUqZQTiYhhTljsmzyFM7n16oVOHYVUfb/JVnvf8XLRSNsG10pDgdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IoA82Q2ZEVJNJ0FtORDuYOR+6+olp8aB1qEhIgqXksI=;
	b=lf32ME3/qIcDEpXjxfxft94kL9fwxmEfItvZ7Az5CQ2Q4Y53frg+ffEdERWD6R4ejH/7
	 YZcSfKkv2usKaBm5Slqe3vULzMdUt+XsIhSuIFGs09cg6zMSsX6OJfFihXl0lTtfGjvTa
	 NQ0cht0X9cRW+aBkaLmnQMiQDk7M39uc1wXsshUsT87rBZioGdFBELjGHuEnxHoMQWsf9
	 Q2bzfVLem/guDNaGA9fYHE7OEWK6P9H4QkY4OzCdFSPba7Bc74lIBZd0YMEmqNDsJbzO5
	 x1A0T73sZ4pdiYR3vNXFgNxwlifZ8wG3cEPBSx5/G2AI8QPNOrwQVsDb6hX+pfYYFZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=thKTbKYD;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AC6606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30AC6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=thKTbKYD
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-381d542bc29so263827eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123204; x=1795728004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoA82Q2ZEVJNJ0FtORDuYOR+6+olp8aB1qEhIgqXksI=;
        b=thKTbKYDMiRq+MDphqsEdZJ4oqLSONrJr8+Bl0EfJzIGzLtw1ICSKZWyDt4a/iUoKI
         xaPkgxIwop0MtzQeIQ7XG9PYu8AeIvOvU/WkzxJ0KqPgD9EnRJtV+G2dcjfmyvIkXEPh
         y5TmAACGTD/8xCPDmaxzk3kEaPffUuEiDe9Ce6Jgq4VlFHdgxaCl6Ro1inR5YtTfq98B
         gkScCe74aRikueGHbzafObsJUvwrhuzfz+l2wNVazIIIK0DP+CHaj5NTCix3xLHNHAtK
         W73tkOULPhrQi3PZfVKcTHSA6R/4uo/czkuCF/LbXgjJKxX8G1IAesrECCCic9Y4jbS0
         mIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123204; x=1795728004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoA82Q2ZEVJNJ0FtORDuYOR+6+olp8aB1qEhIgqXksI=;
        b=n4BZ8nZsKADb5lV0Ay8nEqeogT6EQgNQRPGPAyL7Yob1QM08NRVLB5Aj6Ngy+r7Lux
         wunDzvYHysrrZCTi5CruZ9P7LNBeo15MjDcsbuwqjfYh4jxfyhVKNE2wX21nrCMhLYev
         tjcKYQGI38wXQpjmUqKNBCBFN2wpDpPDQLyZtvOeQ114sa0zmu4Jc27HFW/1CHA20SRO
         dJD2UsmWXznte+S/G0Oy0QGk4T1df5qLGhcGOA2mSFqANHU0lqXydA1WNHZA57pY8B9g
         IoGnPp7BdEX7TfKkHjJtFa9Ad/CX8ahVxZi80PjcGL3CULfo6EOvE39TmHykRZKZ88UC
         O+Dg==
X-Forwarded-Encrypted: i=1; AL+hErFz4/i2yrBVoUkWHAZzeuDh32FInck3Eu9TOVfIceHw0cey9MwHcd39rDyxqqw8b9iIYV+R8Ndn6ZM9NWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NxfJjEq0zG2WV3Jjpf/kuW7py5MMtUJlrZpl8hWlKOPcMz6Ey
	ph7sH6VEN3uW4S2BTmaU5AGv9DlBRTeWypibNOHvKBr4u0XunvzxWjrg
X-Gm-Gg: AZFdTZeGFBSIkRUq2HKq2N6x8s9/os7fE02TL1/bozTAKRZ4Xde8p91kVL4xHVvzh1H
	Egj+GrD2Vdc0I0JgwsZdi9jX7R6vZm5WJ0ynsJgeWQ+6SrkvFGbfyKSnxNBCvyKfTbDFnXocYRt
	+nM8rf+kkrogCyARsuPl0fbKalIJ1L/JKEoWIpUb9qgqFrnTZ8iZg/OwW9Ko2pDsQNa0Z6hNRxQ
	Mpk3lB2AjZ6lMC9tNonratny2BFdcl5lML1Aez/6oW70c/RMbVUDi3biJneq8mU572OrQvzntHH
	qOw56pGUbUtkcS7+EuLr3b7T8wGAOCN0vgVh99dN8Loo8usfHtn0JTJbTRnO5O6yKWiZZhZqsws
	xQGvzuI/FDKt30q0hg8qZqLejqpyavc6sOz6jpO+Uuin2UZStf3dg8b6lFXhvGnaEey/c54XdMQ
	nHr7M4ltQQvefsYTIy+BBeGZoFbN0X6pWqi3T+H5bzchg60yom14F5ou/x1MwQp9/yN6q17ZEJi
	T4VsL8HzzdoL77kOi7loqFK+Dm+X6wV6b23kaynXt4NGN+8SUyT+FkoWgR6dbXbT61HZP6Yn2ov
	r48UkceYXwkanZBOO52FOhHtk0bbM75xLtbnhGvbUF/HeluuZwKMccSyhxuNv91ttzcMrhpHAQt
	ZBnLQkUa+890APOqHUkz3k56Vh08cqasfwYZiSG0RMJdu/66vBAVmQFSYIAENvfNihaYLxbJ97p
	IW/PrVyE1uyvyaAt7y+A==
X-Received: by 2002:a05:693c:8955:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3856c6ab8e7mr602925eec.5.1795123204235;
        Thu, 19 Nov 2026 13:20:04 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm1382576eec.28.2026.11.19.13.20.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 13:20:03 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: vadim.fedorenko@linux.dev
Cc: andi.shyti@kernel.org,
	andrew+netdev@lunn.ch,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	richardcochran@gmail.com,
	skhan@linuxfoundation.org
Subject: Re: [PATCH net-next v3 3/3] ptp: ocp: support the WiWi revision 02 Time Card
Date: Thu, 19 Nov 2026 13:20:01 -0800
Message-ID: <20261119-timecard-common-v2-078fe69f33-r3-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <890ef941-0c52-4e3c-9fce-70b11fd1b198@linux.dev>
References: <20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com> <20261116-wiwi-v3-87afa10a8-3-ahmadexp@gmail.com> <890ef941-0c52-4e3c-9fce-70b11fd1b198@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Vadim,

On Thu, 19 Nov 2026 at 18:44:38 +0000, Vadim Fedorenko wrote:

Regarding the different addressing and interrupt layout:
> another resource table.

Agreed. The next revision has a dedicated ocp_wiwi_resource table with
final BAR0 addresses and MSI-X vector numbers. I removed the runtime
offset/vector adjustment, the temporary resource copy, and the WiWi
filtering from ptp_ocp_register_resources(). The existing FB/Celestica,
ART, ADVA and ADVA X1 tables are unchanged. The WiWi table explicitly
contains the three UARTs and typed XIIC data, but no GNSS2 or SPI entry.

Regarding UART access and the omitted second GNSS interface:
> Why it's not a problem for ADVA and ART boards?

I conflated the peripheral IP with the host interface in that description.
The aligned 32-bit requirement is specific to the WiWi LitePCIe path;
sharing UART IP does not establish the same PCIe access restrictions.
UART width is now selected by per-resource data, with the existing
byte-access default preserved for the other boards. WiWi's XIIC child
uses the force_32bit_access flag from patch 1.

The UART list is a separate issue. ART already has one GNSS UART entry;
ADVA and ADVA X1 have GNSS and MAC entries, not GNSS2. Thomas described
WiWi's second GNSS UART as instantiated but unwired on this board, so
the WiWi table exposes only GNSS, MAC and NMEA. I am not inferring wiring
for arbitrary boards from their PCI revision or claiming that the other
boards have a GNSS2 defect. The external SMA PPS2 input remains available.

Regarding the additional interrupt-readiness check:
> new revision but not for the older ones?

WiWi has a separate LitePCIe per-input gate at BAR0+0x1800, in addition
to the PCI MSI-X masks. The legacy probe does not program that gate.
The WiWi path first opens only UART/XIIC inputs for child probe; it opens
timing inputs after the PHC and handlers exist. Because ptp_clock_register()
can expose the PHC before that second write, an early arm request returns
-EAGAIN without changing subscription state or programming the source.
After the checked write/readback it can be retried. Disable is not gated.

Both early and late gate writes now use the same checked-readback helper;
failure returns -EIO and unwinds probe. This is software ordering, not a
claim that WiWi loses masked pulses or that older firmware replays them.
The common timestamp-removal spinlock fix remains separate and is used
by all boards.

Regarding the path to supporting updates:
> enable flash upgrades?

Not through a supported in-driver procedure in this series. I kept SPI
absent from the WiWi table and its input masked, and reject every WiWi
devlink flash request before looking up MTD or writing anything. There
is no override. This intentionally also removes raw MTD read access.

The documentation now spells out the follow-up needed: validate the
controller's access width and interrupt behavior, specify and check the
WiWi image header and board/revision compatibility, protect the golden
region in every erase/write path including raw MTD, then validate update
readback, activation and interrupted-update/watchdog recovery. Thomas's
description of a modified spi-xilinx path is not validation of an upstream
update implementation. A running build ID is not proof of the active slot.

Validation for this draft includes actual-source resource/UART/gate/flash
tests under ASan/UBSan, the spinlock removal-race suite (100 runs), and
13 deliberately broken variants rejected by the tests. The x86-64 PTP
and XIIC objects build with W=1 and KCFLAGS=-Werror; all four XIIC KUnit
tests pass under QEMU. The five-architecture Kconfig checks also pass.
No new physical-card test, firmware update or masked-pulse replay test
is claimed; the machine has been reserved for Windows HLK. I will report
that limitation in v4.

Thanks,
Ahmad
