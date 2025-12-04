# Secure S3 Storage Module

This Terraform module provisions a **private, encrypted S3 bucket** for secure data storage in AWS. It implements security best practices including public access blocking, versioning, and server-side encryption.

## Purpose

Deploys a hardened S3 bucket suitable for storing sensitive data, backups, logs, or application artifacts with enterprise-grade security controls.

## Key Features

- **Private Access Only**: All public access completely blocked at bucket level
- **Encryption at Rest**: AES256 server-side encryption enabled by default
- **Version Control**: Object versioning enabled to protect against accidental deletions
- **Security Hardening**: Private ACL with no public policies or permissions

## Resources Created

- Private S3 bucket with account-unique naming
- Public access block configuration (all protections enabled)
- Private bucket ACL
- Versioning configuration
- Server-side encryption configuration

## Use Cases

- Secure document storage
- Application backup and recovery
- Log aggregation and archival
- Compliance-regulated data storage
- Internal file sharing within AWS accounts

## Security Compliance

This module follows AWS Well-Architected Framework security best practices and is designed to pass policy-as-code validation for:
- No public S3 buckets
- Encryption requirements
- Access control standards
