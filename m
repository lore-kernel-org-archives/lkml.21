Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793324;
	b=0j0jIQGZPXqlB4sETzZkujW+JRgg0kYy5BcglHxXzzLuhExqjZrx8/u7FXc6lxEIZAxC
	 0wWgBMQ28CkMDVkMOcy/rVR7sWuNSxSKxkL+tFsPv27lcV0f4UDT5JQRfOzgRhSR+Zzs4
	 6z92Uqqq6JXbL12DfSa8eNnJ6/J8YoQRB1AJHpL1SEVFMeqliGXj14V5jpr+MGKkZ5WfE
	 SKKCfihhWpkSV8UvrSgPJ/iSiD56HGqJKxeSTs2l6Y5cuurjge9xD9ZB86RzexZGJ9gOb
	 DoU7wHhR2z9E4T/KuKzhlkJFjJzCIbYxCPH76uwODmEtne2EzRqOmmtp8ttnhhRDZKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793324;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=QPFLcK1okWZcWAtqynqBa6AobahzgjqK0qYjYPQd7Bo=;
	b=RpiqwSaJj1ybsnZcaL7u/gCQNIf1OZRRHyBDNo0kJ8UUzLETWLFJo8sZfwCc8m4XN9gK
	 sYTddfq74V+FJElkyHQ0fo7KG3D0AhrIb+qTAOOfI0YrOR7OdacE+kv/q7OHnCIEqnHEx
	 EmMC9MJTg8yymWedZFKyR/2ycean+ifhaDk94hRzF9sRTxabIMjNQPvD8ycg0940z4Xd7
	 68bNkcskK1l/aLkpzo1RJ4v6QFqRFbuAavY2czr0qNILTChfiktMLdWaRYpHOA9mVmc8K
	 hGNZd6oIxJgOt1noF/64GjlpMb/gkr56uLRDn81JetlU+SXEXKDLaZ57FbJbtutQvng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CfaFiVl6;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78528606B743
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78528606B743
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CfaFiVl6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC278169E;
	Fri, 27 Nov 2026 07:28:40 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C774F3F632;
	Fri, 27 Nov 2026 07:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795793323; bh=6v3GtqRecOMTMqPoCxLqCvZs6XdvKssmwdo9XhTbtNM=;
	h=From:Subject:Date:To:Cc:From;
	b=CfaFiVl6BNmDIBddb7fIf3RRCJZcBtGeyn0WnsoWfT1lT8WwjTAbuLaJltM1v7aW+
	 J7LIpF9pZgeza5WhSKDv6LcbxsXepezefDdTdRYbyvGwALbsakLABDaqbm3l9P1rbZ
	 G17G6LcUer01KATB9dy3xyGqqro9JCqhQJJPGLNY=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH RFC v2 0/6] firmware: arm_firme: introduce FIRME support
 for host attestation
Date: Fri, 27 Nov 2026 15:28:30 +0000
Message-Id: <20261127-firme_interface-v2-0-ab88b2d0b4e0@arm.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ6hCWsC/3WNwQ6CMBBEf4X0bE27AqWeTEz8AK+GmLpuZQ+Aa
 QnREP7dwsGTHmcm780kIgWmKPbZJAKNHLnvUoBNJrBx3YMk31MWoKBUBqz0HFq6cjdQ8A5JmqL
 UJeaFA7UTiXoG8vxajRdxPh1FncqG49CH9/oy6nVahfaHcNRSSWsq8j4HRIKDC+0W+3axL5RW+
 g8FprIFWqSbc1+qnuf5A9kLHnXnAAAA
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jiri Pirko <jiri@resnulli.us>, 
 GONG Ruiqi <gongruiqi1@huawei.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Mark Brown <broonie@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4707; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=6v3GtqRecOMTMqPoCxLqCvZs6XdvKssmwdo9XhTbtNM=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBrCaGmzieZrbSUtvu/UegSU99yz2mdZ42HNtMhU
 twrUs1y7O6JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCawmhpgAKCRBt1cPRWsUx
 MwfgDACTza1ZQ6Q7zFKi/uT8O84474FB1wGBciWbihq1azitfT+JsJroJ2DSX+mGfri4OCTIeY9
 z2g6CPegfv+AoGbXnnPR8SU6igeA16T1FmoiWm8DZ4j3J2+R2z6mpaycVj04YxdQimjpYzkPVoL
 rXYLJ4N81KV2UpkxO/4jr3Pbm89FkFJT1pVqn/vQ8pgGlUwvy+wQ/ZJyXBbZVQC6pqTN06wLmGx
 xM8gGfG2zD62KQ5YitfNrdS1pVEjeRePcWbpcZ/0+JIJ1POE44TE5Fsw5swArOWgIx8G+Y6JEAn
 nRGEGS6BCuQkyJYlvQDyYYy0xeFgfoDihH9dWkwNl+iet1ACCPAEyACmVKcjYse25OzAreR6kYx
 +rudfTOmEWM10/xIY/VoyupL4MEq5RKXU/dJom3C58D4Ruarx6E8vvrM8vMsPvy/OunShi44vEy
 R3RrVCv7V2YQGwhd9auwYM/gZbZnXJgegOLX5P3KeXEY1jTpXQh8bXaWjvHL1wscddNuo=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

The Arm Confidential Compute Architecture (CCA) introduces the
Realm Management Extension (FEAT_RME), which enables the creation and
management of dynamically allocated, attestable trusted execution
environments known as Realms.

Realm management relies on EL3 firmware to provide services for Realm
construction, resource allocation and isolation, and attestation of
the initial Realm state.

The Firmware Interface for Realm Management Extensions (FIRME) [0]
specification defines standard interfaces through which EL3 firmware
provides these services. FIRME defines the following service groups:

  - Granule Protection Table (GPT) management
  - IDE key management for PCIe and CXL Root Ports
  - Memory Encryption Context management
  - Attestation Token management
  - Integrated Device management

FIRME also defines a Base service that provides common functionality,
including service discovery and feature discovery.

Although FIRME primarily supports Arm CCA, its interfaces can also be used
on systems without FEAT_RME to provide firmware-based attestation and
other security services.

This RFC patch series introduces the arm_firme, which provides
the common APIs used to firme service driver implementation.
each firme service driver would be implmented based on the smccc-bus
with common APIs and add firme attestation provider with smccc driver.

This patch based on arm64/for-next/smccc-bus and attestation branch [1-3].

To: linux-kernel@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Suzuki Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Sami Mujawar <sami.mujawar@arm.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: GONG Ruiqi <gongruiqi1@huawei.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mark Brown <broonie@kernel.org>

Link: [0] https://support.arm.com/documentation/den0149/latest
Link: [1] https://github.com/jpirko/linux_mlxsw/tree/wip_attestation_all_2
Link: [2] https://lore.kernel.org/all/20261113155515.2510194-1-jiri@resnulli.us/
Link: [3] https://lore.kernel.org/all/20261113160838.2512652-1-jiri@resnulli.us/
---
Changes in RFCv2:
- rebase on the attestation infrastructure.
- librarise arm_firme.c from firme driver.
- add firme attestation provider.
- Link to RFCv1: https://lore.kernel.org/r/20261019-firme_interface-v1-0-27895c9cebaa@arm.com

---
Yeoreum Yun (6):
      firmware: arm-smccc: introduce match function
      firmware: arm_firme: introduce arm_firme
      Documentation/ctlv: introduce ctlv-attestation-firme family
      ctlv: add auto-generated files for ctlv-attestation-firme
      attestation: providers: introduce FIRME attestation provider
      selftest: attestation: add firme_attestation_test selftest

 Documentation/ctlv/abi/ctlv-attestation-firme.yaml |   19 +
 Documentation/ctlv/abi/families.registry.yaml      |    1 +
 Documentation/ctlv/families.yaml                   |    1 +
 Documentation/ctlv/generated-files.yaml            |   11 +
 .../ctlv/specs/ctlv-attestation-firme.yaml         |   20 +
 drivers/attestation/Kconfig                        |    9 +
 drivers/attestation/Makefile                       |    5 +
 .../generated/ctlv_attestation_firme_gen.c         |   64 +
 .../generated/ctlv_attestation_firme_gen.h         |   40 +
 drivers/attestation/providers/firme.c              |  292 ++++
 drivers/firmware/Kconfig                           |   36 +
 drivers/firmware/Makefile                          |    1 +
 drivers/firmware/arm_firme.c                       |  275 ++++
 drivers/firmware/smccc/bus.c                       |   24 +-
 drivers/firmware/smccc/smccc.c                     |    3 +-
 include/linux/arm-smccc-bus.h                      |    5 +-
 include/linux/arm-smccc.h                          |    1 +
 include/linux/arm_firme.h                          |  261 ++++
 include/uapi/ctlv/ctlv_attestation_firme_gen.h     |   34 +
 include/uapi/ctlv/ctlv_families_gen.h              |    1 +
 tools/testing/selftests/attestation/.gitignore     |    1 +
 tools/testing/selftests/attestation/Makefile       |   10 +-
 .../attestation/ctlv_attestation_firme_user_gen.c  | 1547 ++++++++++++++++++++
 .../attestation/ctlv_attestation_firme_user_gen.h  |   47 +
 .../selftests/attestation/firme_attestation_test.c |  232 +++
 25 files changed, 2928 insertions(+), 12 deletions(-)
---
base-commit: 7ff5e548abbc2312431d4eea9ad283347963a6e2
change-id: 20260729-firme_interface-75616c45a203

Best regards,
-- 
Sincerely,
Yeoreum Yun

